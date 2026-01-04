@echo off
REM Quick script to run the Qiskit project in Docker (Windows CMD)

echo ========================================
echo Running Qiskit Project in Docker
echo ========================================
echo.

REM Check if Docker is running
docker info >nul 2>&1
if errorlevel 1 (
    echo Error: Docker is not running. Please start Docker Desktop.
    pause
    exit /b 1
)

REM Build the Docker image
echo Building Docker image...
docker build -t learn-qiskit .

if errorlevel 1 (
    echo Failed to build Docker image
    pause
    exit /b 1
)

echo.
echo Running quantum example...
echo.
docker run --rm learn-qiskit python hello_quantum.py

pause

