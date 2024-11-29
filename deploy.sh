#!/bin/bash

# Stop and remove existing containers
echo "Stopping existing containers..."
docker-compose down -v

# Pull latest changes (uncomment if you're using git)
# git pull origin main

# Build and start containers
echo "Building and starting containers..."
docker-compose up --build -d

# Clean up unused images
echo "Cleaning up unused Docker images..."
docker image prune -f

echo "Deployment completed!"

# Check the status of the containers
echo "Checking container status..."
docker-compose ps
