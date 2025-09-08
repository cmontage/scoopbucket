@echo off
echo Starting Scoop Official Buckets Sync...
echo.

REM 检查PowerShell是否可用
powershell -Command "Write-Host 'PowerShell is available'" >nul 2>&1
if errorlevel 1 (
    echo Error: PowerShell is not available or not in PATH
    pause
    exit /b 1
)

REM 运行同步脚本
echo Syncing all official buckets...
powershell -ExecutionPolicy Bypass -File sync-buckets.ps1 all

echo.
echo Sync completed! Press any key to exit...
pause >nul
