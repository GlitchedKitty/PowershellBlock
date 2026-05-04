$profilePath = $PROFILE.CurrentUserAllHosts
$profileDir  = Split-Path $profilePath -Parent

$profileContent = @'
cmd.exe /c "net session >nul 2>&1"
$IsElevated = ($LASTEXITCODE -eq 0)

if (-not $IsElevated) {
    Write-Host ""
    Write-Host "PowerShell access has been disabled by your administrator." -ForegroundColor Red
    Write-Host ""
    Write-Host "Please contact IT if you believe this is in error." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Press any key to close..." -ForegroundColor Gray

    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Stop-Process -Id $PID -Force
}
'@

if ([string]::IsNullOrWhiteSpace($profilePath)) {
    throw "PowerShell profile path could not be resolved."
}

if (-not (Test-Path -LiteralPath $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
}

$profileContent | Set-Content -LiteralPath $profilePath -Encoding UTF8 -Force