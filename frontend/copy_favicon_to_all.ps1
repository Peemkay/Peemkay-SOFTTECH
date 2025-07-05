# Copy favicon.png to replace all logos and icons
Write-Host "🎨 Copying favicon.png to replace ALL logos and icons..." -ForegroundColor Cyan
Write-Host ""

# Copy favicon.png to all web icon locations
Write-Host "Updating web icons..." -ForegroundColor Yellow
Copy-Item "web\favicon.png" "web\icons\Icon-192.png" -Force
Copy-Item "web\favicon.png" "web\icons\Icon-512.png" -Force
Copy-Item "web\favicon.png" "web\icons\Icon-maskable-192.png" -Force
Copy-Item "web\favicon.png" "web\icons\Icon-maskable-512.png" -Force

# Copy for Apple touch icon
Copy-Item "web\favicon.png" "web\apple-touch-icon.png" -Force

# Copy to assets (replace app logo)
Write-Host "Updating app logo..." -ForegroundColor Yellow
Copy-Item "web\favicon.png" "assets\icons\app_logo.png" -Force

# Remove old SVG files
Write-Host "Removing old SVG files..." -ForegroundColor Yellow
if (Test-Path "web\favicon.svg") { Remove-Item "web\favicon.svg" -Force }
if (Test-Path "assets\icons\app_logo.svg") { Remove-Item "assets\icons\app_logo.svg" -Force }

Write-Host ""
Write-Host "✅ ALL logos and icons updated with your favicon.png!" -ForegroundColor Green
Write-Host ""
Write-Host "Files updated:" -ForegroundColor White
Write-Host "  ✅ web\favicon.png (source)" -ForegroundColor Green
Write-Host "  ✅ web\icons\Icon-192.png" -ForegroundColor Green
Write-Host "  ✅ web\icons\Icon-512.png" -ForegroundColor Green
Write-Host "  ✅ web\icons\Icon-maskable-192.png" -ForegroundColor Green
Write-Host "  ✅ web\icons\Icon-maskable-512.png" -ForegroundColor Green
Write-Host "  ✅ web\apple-touch-icon.png" -ForegroundColor Green
Write-Host "  ✅ assets\icons\app_logo.png" -ForegroundColor Green
Write-Host ""
Write-Host "Removed:" -ForegroundColor White
Write-Host "  🗑️ web\favicon.svg" -ForegroundColor Red
Write-Host "  🗑️ assets\icons\app_logo.svg" -ForegroundColor Red
Write-Host ""
Write-Host "🎉 Your website now uses your favicon.png everywhere!" -ForegroundColor Cyan
Write-Host ""
Read-Host "Press Enter to continue"
