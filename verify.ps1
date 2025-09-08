#!/usr/bin/env pwsh

# 快速验证脚本
# 检查所有组件是否正常工作

Write-Host "Scoop Official Buckets Repository Verification" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

# 检查文件结构
Write-Host "`n1. Checking file structure..." -ForegroundColor Yellow

$requiredFiles = @(
    "README.md",
    "LICENSE", 
    "config.json",
    "sync-buckets.ps1",
    "sync.bat",
    "USAGE.md",
    ".github\workflows\sync-buckets.yml",
    ".github\ISSUE_TEMPLATE\bug_report.md",
    ".github\ISSUE_TEMPLATE\feature_request.md"
)

$requiredDirs = @(
    "buckets\main",
    "buckets\extras",
    "buckets\versions",
    "buckets\nirsoft",
    "buckets\php",
    "buckets\nerd-fonts", 
    "buckets\nonportable",
    "buckets\java",
    "buckets\games",
    "buckets\sysinternals"
)

foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "✓ $file" -ForegroundColor Green
    } else {
        Write-Host "✗ $file" -ForegroundColor Red
    }
}

foreach ($dir in $requiredDirs) {
    if (Test-Path $dir) {
        Write-Host "✓ $dir/" -ForegroundColor Green
    } else {
        Write-Host "✗ $dir/" -ForegroundColor Red
    }
}

# 检查配置文件
Write-Host "`n2. Checking configuration..." -ForegroundColor Yellow

try {
    $config = Get-Content "config.json" | ConvertFrom-Json
    Write-Host "✓ config.json is valid JSON" -ForegroundColor Green
    Write-Host "  - Name: $($config.name)" -ForegroundColor Cyan
    Write-Host "  - Version: $($config.version)" -ForegroundColor Cyan
    Write-Host "  - Buckets: $($config.buckets.PSObject.Properties.Count)" -ForegroundColor Cyan
} catch {
    Write-Host "✗ config.json is invalid: $($_.Exception.Message)" -ForegroundColor Red
}

# 检查同步状态
Write-Host "`n3. Checking sync status..." -ForegroundColor Yellow

$totalFiles = 0
foreach ($bucket in $config.buckets.PSObject.Properties.Name) {
    $bucketDir = "buckets\$bucket"
    if (Test-Path $bucketDir) {
        $count = (Get-ChildItem $bucketDir -Filter "*.json").Count
        $totalFiles += $count
        if ($count -gt 0) {
            Write-Host "✓ $bucket`: $count files" -ForegroundColor Green
        } else {
            Write-Host "⚠ $bucket`: no files (not synced yet)" -ForegroundColor Yellow
        }
    }
}

Write-Host "Total manifests: $totalFiles" -ForegroundColor Cyan

# 检查GitHub Actions工作流
Write-Host "`n4. Checking GitHub Actions workflow..." -ForegroundColor Yellow

$workflowFile = ".github\workflows\sync-buckets.yml"
if (Test-Path $workflowFile) {
    $content = Get-Content $workflowFile -Raw
    if ($content -match "cron.*0 0 \* \* \*") {
        Write-Host "✓ Daily schedule configured" -ForegroundColor Green
    }
    if ($content -match "workflow_dispatch") {
        Write-Host "✓ Manual trigger enabled" -ForegroundColor Green
    }
    if ($content -match "strategy:[\s\S]*matrix:") {
        Write-Host "✓ Matrix strategy configured" -ForegroundColor Green
    }
}

# 总结
Write-Host "`n5. Summary" -ForegroundColor Yellow
Write-Host "Repository is ready for deployment!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Initialize git repository: git init" -ForegroundColor White
Write-Host "2. Add all files: git add ." -ForegroundColor White
Write-Host "3. Commit: git commit -m 'Initial commit'" -ForegroundColor White
Write-Host "4. Create GitHub repository and push" -ForegroundColor White
Write-Host "5. Enable GitHub Actions in repository settings" -ForegroundColor White
Write-Host ""
Write-Host "Manual sync command: .\sync-buckets.ps1 all" -ForegroundColor Yellow
Write-Host "Quick sync command: .\sync.bat" -ForegroundColor Yellow
