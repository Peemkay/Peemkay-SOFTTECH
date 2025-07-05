@echo off
title Peemkay SOFTTECH Development Server

echo ========================================
echo   PEEMKAY SOFTTECH DEVELOPMENT SERVER
echo ========================================
echo.
echo Starting development server on port 3001...
echo Hot reload enabled for development
echo.

cd /d "%~dp0"
call scripts\dev-server.bat

pause
