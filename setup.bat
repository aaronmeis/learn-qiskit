@echo off
REM Qiskit Project Setup Script for Windows Command Prompt
REM Run this script after installing Python

echo ========================================
echo Qiskit Project Setup
echo ========================================
echo.

REM Check if Python is installed
echo Checking Python installation...
python --version >nul 2>&1
if errorlevel 1 (
    echo Python not found!
    echo.
    echo Please install Python 3.8+ from https://www.python.org/downloads/
    echo Make sure to check 'Add Python to PATH' during installation.
    pause
    exit /b 1
)

python --version
echo.

REM Check if virtual environment already exists
if exist "venv" (
    echo Virtual environment already exists. Skipping creation.
    echo.
) else (
    echo Creating virtual environment...
    python -m venv venv
    if errorlevel 1 (
        echo Failed to create virtual environment
        pause
        exit /b 1
    )
    echo Virtual environment created.
    echo.
)

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM Upgrade pip
echo.
echo Upgrading pip...
python -m pip install --upgrade pip

REM Install dependencies
echo.
echo Installing dependencies...
pip install -r requirements.txt

if errorlevel 1 (
    echo.
    echo Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo To run the project:
echo   1. Activate the virtual environment: venv\Scripts\activate
echo   2. Run the script: python hello_quantum.py
echo.
pause

