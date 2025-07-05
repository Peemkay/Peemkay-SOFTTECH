@echo off
title Peemkay SOFTTECH Portfolio Server

echo ========================================
echo    PEEMKAY SOFTTECH PORTFOLIO WEBSITE
echo ========================================
echo.
echo Starting server on port 3000...
echo.

cd /d "%~dp0"
call scripts\start-server.bat

pause
