@echo off
echo Setting up Git repository for Peemkay SOFTTECH...
echo.

REM Change remote URL to HTTPS
git remote set-url origin https://github.com/Peemkay/Peemkay-SOFTTECH.git

REM Add all files
git add .

REM Commit changes
git commit -m "Complete Peemkay SOFTTECH portfolio website with fixed ports and comprehensive features"

REM Push to GitHub (will prompt for credentials)
echo.
echo Pushing to GitHub...
echo You will be prompted for your GitHub username and password/token
echo.
git push -u origin main

echo.
echo Git setup complete!
echo Repository: https://github.com/Peemkay/Peemkay-SOFTTECH
pause
