# Use slim Python base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy the PyInstaller executable
COPY docker-app.bin .
COPY docker-dashboard.html .

# Make the binary executable
RUN chmod +x docker-app.bin

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Run the executable directly
CMD ["./docker-app.bin"]