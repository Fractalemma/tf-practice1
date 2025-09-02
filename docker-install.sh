#!/bin/bash

# Welcome message
echo "Hello, "$(whoami)
echo "This is part of the Terraform Section from the DevOps Training"
sleep 3
echo "I will set up your EC2 instance through Terraform"
sleep 3
echo "Make sure to read and understand how this file works"
sleep 3

# Install Docker
echo "Installing Docker..."
sleep 3
sudo yum install -y docker \

# Start the Docker service
echo "Starting Docker service..."
sleep 3
sudo service docker start

# Enable Docker to start on boot
echo "Enabling Docker to start on boot..."
sleep 3
sudo chkconfig docker on

# Add the current user to the docker group
# This allows running Docker commands without sudo
echo "Adding current user to the 'docker' group..."
sleep 3
sudo usermod -a -G docker $(whoami)
sleep 3
echo "Docker installation complete."
echo "WAIT!"
sleep 1
echo "We are not done yet. Please follow the next instructions:"
sleep 1
echo "Please log out of your SSH session and log back in for the docker group membership change to take effect..."
sleep 2
echo "Once you're back in, verify the installation by running 'docker ps' "
echo "You shouldn't have anything running"
sleep 1
echo "Then enter 'docker run hello-world'"
sleep 1
echo "Wait for a few seconds"
sleep 2
echo "Once finished, run 'docker ps' again"