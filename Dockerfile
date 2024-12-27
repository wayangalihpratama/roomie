# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Upgrade pip
RUN pip install --upgrade pip

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Make the start.sh script executable
RUN chmod +x start.sh

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run the start.sh script when the container launches
CMD ["./start.sh"]
