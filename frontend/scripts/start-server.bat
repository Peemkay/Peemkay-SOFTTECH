@echo off
echo Starting Peemkay SOFTTECH Portfolio Website...
echo.

REM Set consistent port
set PORT=3000

REM Check if port is already in use
netstat -an | find ":%PORT%" >nul
if %errorlevel% == 0 (
    echo Port %PORT% is already in use. Trying to kill existing process...
    for /f "tokens=5" %%a in ('netstat -ano ^| find ":%PORT%" ^| find "LISTENING"') do (
        echo Killing process %%a
        taskkill /PID %%a /F >nul 2>&1
    )
    timeout /t 2 >nul
)

REM Build the web app
echo Building Flutter web app...
flutter build web
if %errorlevel% neq 0 (
    echo Build failed! Please check for errors.
    pause
    exit /b 1
)

REM Start the server
echo.
echo Starting server on port %PORT%...
echo.
echo Website will be available at:
echo   Local:    http://localhost:%PORT%
echo   Network:  http://[YOUR_IP]:%PORT%
echo.
echo Press Ctrl+C to stop the server
echo.

python -m http.server %PORT% --bind 0.0.0.0 --directory build/web
