@echo off
echo 🎨 Copying pmklogo from Downloads to replace ALL app icons...
echo.

echo 📂 Source: C:\Users\chaki\Downloads\pmklogo
echo 📂 Target: Peemkay SOFTTECH project folders
echo.

REM Replace favicon.png in web/ folder
echo Replacing favicon.png in web/ folder...
copy "C:\Users\chaki\Downloads\pmklogo" "web\favicon.png"

REM Replace Icon-*.png files in web/icons/ folder
echo Replacing Icon-*.png files in web/icons/ folder...
copy "C:\Users\chaki\Downloads\pmklogo" "web\icons\Icon-192.png"
copy "C:\Users\chaki\Downloads\pmklogo" "web\icons\Icon-512.png"
copy "C:\Users\chaki\Downloads\pmklogo" "web\icons\Icon-maskable-192.png"
copy "C:\Users\chaki\Downloads\pmklogo" "web\icons\Icon-maskable-512.png"

REM Replace app_logo.png in assets/icons/ folder
echo Replacing app_logo.png in assets/icons/ folder...
copy "C:\Users\chaki\Downloads\pmklogo" "assets\icons\app_logo.png"

REM Replace additional icon files
echo Replacing additional icon files...
copy "C:\Users\chaki\Downloads\pmklogo" "web\apple-touch-icon.png"
copy "C:\Users\chaki\Downloads\pmklogo" "web\favicon-32x32.png"

echo.
echo ✅ ALL ICONS REPLACED WITH YOUR DOWNLOADS PMKLOGO!
echo.
echo 📋 Replaced files:
echo   ✅ web\favicon.png
echo   ✅ web\icons\Icon-192.png
echo   ✅ web\icons\Icon-512.png
echo   ✅ web\icons\Icon-maskable-192.png
echo   ✅ web\icons\Icon-maskable-512.png
echo   ✅ assets\icons\app_logo.png
echo   ✅ web\apple-touch-icon.png
echo   ✅ web\favicon-32x32.png
echo.
echo 🚀 Your pmklogo from Downloads is now used everywhere!
echo 🌐 Hot restart your Flutter app to see the changes.
pause
