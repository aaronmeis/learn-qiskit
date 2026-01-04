#!/bin/bash
# Quick script to run the Qiskit project in Docker

echo "========================================"
echo "Running Qiskit Project in Docker"
echo "========================================"
echo ""

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Error: Docker is not running. Please start Docker Desktop."
    exit 1
fi

# Build and run the container
echo "Building Docker image..."
docker build -t learn-qiskit .

if [ $? -eq 0 ]; then
    echo ""
    echo "Running quantum example..."
    echo ""
    docker run --rm learn-qiskit python hello_quantum.py
else
    echo "Failed to build Docker image"
    exit 1
fi

