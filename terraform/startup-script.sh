#!/bin/bash

# Update the package list
echo "Updating package list..."
apt-get update -y

# Install Docker
echo "Installing Docker..."
apt-get install -y docker.io

# Start Docker service
echo "Starting Docker service..."
systemctl start docker
systemctl enable docker

# Pull the latest Docker image for your API
echo "Pulling the latest Docker image druvadocker/stockchatbot..."
docker pull druvadocker/stockchatbot:latest

# Run the Docker container for stockchatbot, exposing port 5000
echo "Running the Docker container for stockchatbot..."
docker run -d -p 5000:5000 --name stockchatbot druvadocker/stockchatbot:latest

# Confirmation message
echo "Startup script completed successfully."
