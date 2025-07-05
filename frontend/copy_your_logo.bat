@echo off
echo 🎨 Copying your actual Pmk logo.png to all locations...
echo.

echo 📂 Source: C:\Users\chaki\Desktop\LENOVO\Pmk logo.png
echo 📂 Target: Peemkay SOFTTECH project folders
echo.

REM Copy your actual logo to web favicon
echo Copying to web favicon...
copy "C:\Users\chaki\Desktop\LENOVO\Pmk logo.png" "web\favicon.png"

REM Copy to all web icons
echo Copying to web icons...
copy "C:\Users\chaki\Desktop\LENOVO\Pmk logo.png" "web\icons\Icon-192.png"
copy "C:\Users\chaki\Desktop\LENOVO\Pmk logo.png" "web\icons\Icon-512.png"
copy "C:\Users\chaki\Desktop\LENOVO\Pmk logo.png" "web\icons\Icon-maskable-192.png"
copy "C:\Users\chaki\Desktop\LENOVO\Pmk logo.png" "web\icons\Icon-maskable-512.png"

REM Copy to Apple touch icon
echo Copying to Apple touch icon...
copy "C:\Users\chaki\Desktop\LENOVO\Pmk logo.png" "web\apple-touch-icon.png"

REM Copy to app assets
echo Copying to app assets...
copy "C:\Users\chaki\Desktop\LENOVO\Pmk logo.png" "assets\icons\app_logo.png"

REM Copy additional sizes
echo Copying additional sizes...
copy "C:\Users\chaki\Desktop\LENOVO\Pmk logo.png" "web\favicon-32x32.png"

echo.
echo ✅ YOUR ACTUAL LOGO HAS BEEN COPIED TO ALL LOCATIONS!
echo.
echo 📋 Updated files with your Pmk logo.png:
echo   ✅ web\favicon.png
echo   ✅ web\icons\Icon-192.png
echo   ✅ web\icons\Icon-512.png
echo   ✅ web\icons\Icon-maskable-192.png
echo   ✅ web\icons\Icon-maskable-512.png
echo   ✅ web\apple-touch-icon.png
echo   ✅ assets\icons\app_logo.png
echo   ✅ web\favicon-32x32.png
echo.
echo 🚀 Next steps:
echo   1. Run this script to copy your logo
echo   2. Use the Theme Logo Creator (opened in browser) for optimized versions
echo   3. Hot restart your Flutter app to see changes
echo.
echo 🌐 Your actual Pmk logo will now appear everywhere!
pause
