# Copy pmklogo from Downloads to replace all app icons
Write-Host "🎨 Copying pmklogo from Downloads to replace ALL app icons..." -ForegroundColor Cyan
Write-Host ""

# Define possible source files
$possibleSources = @(
    "C:\Users\chaki\Downloads\pmklogo",
    "C:\Users\chaki\Downloads\pmklogo.png",
    "C:\Users\chaki\Downloads\pmklogo.jpg",
    "C:\Users\chaki\Downloads\pmklogo.jpeg"
)

# Find the actual source file
$sourceFile = $null
foreach ($source in $possibleSources) {
    if (Test-Path $source) {
        $sourceFile = $source
        Write-Host "✅ Found source file: $source" -ForegroundColor Green
        break
    }
}

if (-not $sourceFile) {
    Write-Host "❌ Could not find pmklogo file in Downloads folder" -ForegroundColor Red
    Write-Host "Checked locations:" -ForegroundColor Yellow
    foreach ($source in $possibleSources) {
        Write-Host "  - $source" -ForegroundColor Yellow
    }
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "📂 Source: $sourceFile" -ForegroundColor White
Write-Host "📂 Target: Peemkay SOFTTECH project folders" -ForegroundColor White
Write-Host ""

# Replace favicon.png in web/ folder
Write-Host "Replacing favicon.png in web/ folder..." -ForegroundColor Yellow
Copy-Item $sourceFile "web\favicon.png" -Force

# Replace Icon-*.png files in web/icons/ folder
Write-Host "Replacing Icon-*.png files in web/icons/ folder..." -ForegroundColor Yellow
Copy-Item $sourceFile "web\icons\Icon-192.png" -Force
Copy-Item $sourceFile "web\icons\Icon-512.png" -Force
Copy-Item $sourceFile "web\icons\Icon-maskable-192.png" -Force
Copy-Item $sourceFile "web\icons\Icon-maskable-512.png" -Force

# Replace app_logo.png in assets/icons/ folder
Write-Host "Replacing app_logo.png in assets/icons/ folder..." -ForegroundColor Yellow
Copy-Item $sourceFile "assets\icons\app_logo.png" -Force

# Replace additional icon files
Write-Host "Replacing additional icon files..." -ForegroundColor Yellow
Copy-Item $sourceFile "web\apple-touch-icon.png" -Force
Copy-Item $sourceFile "web\favicon-32x32.png" -Force

Write-Host ""
Write-Host "✅ ALL ICONS REPLACED WITH YOUR DOWNLOADS PMKLOGO!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Replaced files:" -ForegroundColor White
Write-Host "  ✅ web\favicon.png" -ForegroundColor Green
Write-Host "  ✅ web\icons\Icon-192.png" -ForegroundColor Green
Write-Host "  ✅ web\icons\Icon-512.png" -ForegroundColor Green
Write-Host "  ✅ web\icons\Icon-maskable-192.png" -ForegroundColor Green
Write-Host "  ✅ web\icons\Icon-maskable-512.png" -ForegroundColor Green
Write-Host "  ✅ assets\icons\app_logo.png" -ForegroundColor Green
Write-Host "  ✅ web\apple-touch-icon.png" -ForegroundColor Green
Write-Host "  ✅ web\favicon-32x32.png" -ForegroundColor Green
Write-Host ""
Write-Host "🚀 Your pmklogo from Downloads is now used everywhere!" -ForegroundColor Cyan
Write-Host "🌐 Hot restart your Flutter app to see the changes." -ForegroundColor Cyan
Write-Host ""
Read-Host "Press Enter to continue"
