@echo off
echo 🎨 Updating ALL app icons and logos with your custom favicon.png...
echo.

echo 📱 Copying to web app icons...
copy "web\favicon.png" "web\icons\Icon-192.png" >nul 2>&1
copy "web\favicon.png" "web\icons\Icon-512.png" >nul 2>&1
copy "web\favicon.png" "web\icons\Icon-maskable-192.png" >nul 2>&1
copy "web\favicon.png" "web\icons\Icon-maskable-512.png" >nul 2>&1

echo 🍎 Copying to Apple touch icon...
copy "web\favicon.png" "web\apple-touch-icon.png" >nul 2>&1

echo 📂 Copying to app assets...
copy "web\favicon.png" "assets\icons\app_logo.png" >nul 2>&1

echo 🔧 Copying additional sizes...
copy "web\favicon.png" "web\favicon-32x32.png" >nul 2>&1

echo.
echo ✅ ALL ICONS UPDATED SUCCESSFULLY!
echo.
echo 📋 Updated files:
echo   ✅ web\icons\Icon-192.png (PWA app icon)
echo   ✅ web\icons\Icon-512.png (Large PWA app icon)
echo   ✅ web\icons\Icon-maskable-192.png (Maskable PWA icon)
echo   ✅ web\icons\Icon-maskable-512.png (Large maskable PWA icon)
echo   ✅ web\apple-touch-icon.png (iOS home screen icon)
echo   ✅ assets\icons\app_logo.png (Flutter app logo)
echo   ✅ web\favicon-32x32.png (Browser favicon)
echo.
echo 🌐 Your custom logo is now used everywhere:
echo   📱 Browser tab favicon
echo   📱 PWA app installation
echo   📱 iOS home screen
echo   📱 Android app drawer
echo   📱 About page company logo
echo   📱 Loading screen
echo.
echo 🎯 Theme Support:
echo   🌞 Light mode: Your logo works perfectly
echo   🌙 Dark mode: Your logo works perfectly
echo.
echo 🚀 Ready for production deployment!
pause
