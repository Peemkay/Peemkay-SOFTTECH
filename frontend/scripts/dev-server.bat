@echo off
echo Starting Peemkay SOFTTECH Development Server...
echo.

REM Set consistent port for development
set PORT=3001

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

echo.
echo Starting Flutter development server on port %PORT%...
echo.
echo Development server will be available at:
echo   Local:    http://localhost:%PORT%
echo   Network:  http://[YOUR_IP]:%PORT%
echo.
echo Press Ctrl+C to stop the server
echo.

flutter run -d web-server --web-port=%PORT% --web-hostname=0.0.0.0
