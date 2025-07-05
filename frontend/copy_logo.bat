@echo off
echo 🎨 Copying your favicon.png to replace ALL logos and icons...
echo.

REM Copy favicon.png to all web icon locations
echo Updating web icons...
copy "web\favicon.png" "web\icons\Icon-192.png"
copy "web\favicon.png" "web\icons\Icon-512.png"
copy "web\favicon.png" "web\icons\Icon-maskable-192.png"
copy "web\favicon.png" "web\icons\Icon-maskable-512.png"

REM Copy for Apple touch icon
copy "web\favicon.png" "web\apple-touch-icon.png"

REM Copy to assets (replace app logo)
echo Updating app logo...
copy "web\favicon.png" "assets\icons\app_logo.png"

REM Remove old SVG files and replace with PNG
echo Replacing SVG files...
if exist "web\favicon.svg" del "web\favicon.svg"
if exist "assets\icons\app_logo.svg" del "assets\icons\app_logo.svg"

echo.
echo ✅ ALL logos and icons updated with your favicon.png!
echo.
echo Files updated:
echo   ✅ web\favicon.png (already exists)
echo   ✅ web\icons\Icon-192.png
echo   ✅ web\icons\Icon-512.png
echo   ✅ web\icons\Icon-maskable-192.png
echo   ✅ web\icons\Icon-maskable-512.png
echo   ✅ web\apple-touch-icon.png
echo   ✅ assets\icons\app_logo.png
echo.
echo Removed:
echo   🗑️ web\favicon.svg
echo   🗑️ assets\icons\app_logo.svg
echo.
echo 🎉 Your website now uses your favicon.png everywhere!
pause
