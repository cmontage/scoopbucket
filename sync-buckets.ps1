#!/usr/bin/env pwsh

# Scoop官方存储库同步脚本
# 用于本地测试和手动同步

param(
    [string]$BucketName = "all"
)

# Scoop官方存储库映射
$buckets = @{
    "main" = "ScoopInstaller/Main"
    "extras" = "ScoopInstaller/Extras" 
    "versions" = "ScoopInstaller/Versions"
    "nirsoft" = "ScoopInstaller/Nirsoft"
    "php" = "ScoopInstaller/PHP"
    "nerd-fonts" = "ScoopInstaller/Nerd-Fonts"
    "nonportable" = "ScoopInstaller/Nonportable"
    "java" = "ScoopInstaller/Java"
    "games" = "ScoopInstaller/Games"
    "sysinternals" = "ScoopInstaller/Sysinternals"
}

function Sync-Bucket {
    param(
        [string]$Name,
        [string]$Repo
    )
    
    Write-Host "Syncing bucket: $Name ($Repo)" -ForegroundColor Green
    
    # 创建目录
    $bucketDir = "buckets\$Name"
    if (!(Test-Path $bucketDir)) {
        New-Item -ItemType Directory -Path $bucketDir -Force | Out-Null
    }
    
    try {
        # 获取存储库的bucket目录内容
        $apiUrl = "https://api.github.com/repos/$Repo/contents/bucket"
        Write-Host "Getting file list..."
        
        $response = Invoke-RestMethod -Uri $apiUrl -Headers @{
            "Accept" = "application/vnd.github.v3+json"
            "User-Agent" = "PowerShell-ScoopSync"
        }
        
        # 过滤.json文件
        $jsonFiles = $response | Where-Object { $_.name -like "*.json" }
        
        Write-Host "Found $($jsonFiles.Count) manifests"
        
        # 下载每个文件
        $count = 0
        foreach ($file in $jsonFiles) {
            $count++
            $progress = [math]::Round(($count / $jsonFiles.Count) * 100, 1)
            Write-Progress -Activity "Downloading $Name bucket" -Status "$($file.name) ($count/$($jsonFiles.Count))" -PercentComplete $progress
            
            $filePath = Join-Path $bucketDir $file.name
            try {
                Invoke-WebRequest -Uri $file.download_url -OutFile $filePath
            }
            catch {
                Write-Warning "Download failed: $($file.name) - $($_.Exception.Message)"
            }
        }
        
        Write-Progress -Activity "Downloading $Name bucket" -Completed
        Write-Host "Successfully synced $Name bucket ($($jsonFiles.Count) files)" -ForegroundColor Green
        
    }
    catch {
        Write-Error "Error syncing $Name bucket: $($_.Exception.Message)"
    }
}

function Show-Statistics {
    Write-Host "`n=== Statistics ===" -ForegroundColor Cyan
    $totalCount = 0
    
    foreach ($bucket in $buckets.Keys | Sort-Object) {
        $bucketDir = "buckets\$bucket"
        if (Test-Path $bucketDir) {
            $count = (Get-ChildItem $bucketDir -Filter "*.json").Count
            $totalCount += $count
            Write-Host "$bucket`: $count apps" -ForegroundColor Yellow
        }
    }
    
    Write-Host "Total: $totalCount apps" -ForegroundColor Green
}

# 主执行逻辑
Write-Host "Scoop Official Buckets Sync Tool" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan

if ($BucketName -eq "all") {
    Write-Host "Syncing all official buckets..." -ForegroundColor Yellow
    
    foreach ($bucket in $buckets.GetEnumerator()) {
        Sync-Bucket -Name $bucket.Key -Repo $bucket.Value
        Start-Sleep -Seconds 1  # 避免API限制
    }
}
elseif ($buckets.ContainsKey($BucketName)) {
    Write-Host "Syncing bucket: $BucketName" -ForegroundColor Yellow
    Sync-Bucket -Name $BucketName -Repo $buckets[$BucketName]
}
else {
    Write-Error "Unknown bucket name: $BucketName"
    Write-Host "Available buckets:" -ForegroundColor Yellow
    $buckets.Keys | Sort-Object | ForEach-Object { Write-Host "  - $_" }
    exit 1
}

# 显示统计信息
Show-Statistics

Write-Host "`nSync completed!" -ForegroundColor Green
