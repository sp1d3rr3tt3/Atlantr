@echo off
REM Atlantr Build Script for Windows
REM This script builds the Atlantr IMAP checker executable

echo ======================================
echo    Atlantr Build Script
echo ======================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed
    exit /b 1
)

echo Python version:
python --version
echo.

REM Check if pip is installed
pip --version >nul 2>&1
if errorlevel 1 (
    echo Error: pip is not installed
    exit /b 1
)

REM Install dependencies
echo Installing dependencies...
pip install -r requirements.txt

REM Install PyInstaller if not already installed
echo Installing PyInstaller...
pip install pyinstaller

REM Clean previous builds
echo Cleaning previous builds...
if exist build rmdir /s /q build
if exist dist rmdir /s /q dist

REM Build the executable
echo Building Atlantr executable...
pyinstaller --clean atlantr.spec

echo.
echo ======================================
echo    Build Complete!
echo ======================================
echo.
echo The executable can be found in the 'dist' directory
dir dist
echo.
pause
