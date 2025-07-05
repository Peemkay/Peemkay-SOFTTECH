# Peemkay SOFTTECH Portfolio Server Startup Script
param(
    [int]$Port = 3000,
    [string]$Host = "0.0.0.0"
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   PEEMKAY SOFTTECH PORTFOLIO WEBSITE" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if port is in use
$portInUse = Get-NetTCPConnection -LocalPort $Port -ErrorAction SilentlyContinue
if ($portInUse) {
    Write-Host "Port $Port is already in use. Attempting to free it..." -ForegroundColor Yellow
    $processes = Get-Process | Where-Object { $_.ProcessName -eq "python" }
    foreach ($process in $processes) {
        try {
            $process.Kill()
            Write-Host "Killed process $($process.Id)" -ForegroundColor Green
        }
        catch {
            Write-Host "Could not kill process $($process.Id)" -ForegroundColor Red
        }
    }
    Start-Sleep -Seconds 2
}

# Build the application
Write-Host "Building Flutter web application..." -ForegroundColor Yellow
$buildResult = & flutter build web
if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed! Please check for errors." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Get local IP address
$localIP = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -ne "127.0.0.1" -and $_.PrefixOrigin -eq "Dhcp" }).IPAddress | Select-Object -First 1

Write-Host ""
Write-Host "Starting server on port $Port..." -ForegroundColor Green
Write-Host ""
Write-Host "Website will be available at:" -ForegroundColor White
Write-Host "  Local:    http://localhost:$Port" -ForegroundColor Cyan
if ($localIP) {
    Write-Host "  Network:  http://$localIP:$Port" -ForegroundColor Cyan
}
Write-Host ""
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

# Start the server
& python -m http.server $Port --bind $Host --directory build/web
