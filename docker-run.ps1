# Quick script to run the Qiskit project in Docker (PowerShell)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Running Qiskit Project in Docker" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Docker is running
try {
    docker info | Out-Null
} catch {
    Write-Host "Error: Docker is not running. Please start Docker Desktop." -ForegroundColor Red
    exit 1
}

# Build the Docker image
Write-Host "Building Docker image..." -ForegroundColor Yellow
docker build -t learn-qiskit .

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "Running quantum example..." -ForegroundColor Yellow
    Write-Host ""
    docker run --rm learn-qiskit python hello_quantum.py
} else {
    Write-Host "Failed to build Docker image" -ForegroundColor Red
    exit 1
}

