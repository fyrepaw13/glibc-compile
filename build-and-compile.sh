#!/bin/bash
set -e

IMAGE_NAME="ubuntu1804_glibc227"     # can change this to anything you want
CONTAINER_NAME="glibc_build_temp"    # can change this to anything you want
HOST_BINARY_NAME="test"              # can change this to anything you want

# Build the image from the current directory
echo "[*] Building Docker image..."
sudo docker build -t "$IMAGE_NAME" .

# Run the container (compile inside)
echo "[*] Running container to compile..."
sudo docker run --name "$CONTAINER_NAME" "$IMAGE_NAME"

# Copy the binary from the container to host
echo "[*] Copying binary from container..."
sudo docker cp "$CONTAINER_NAME":/work/$HOST_BINARY_NAME "./$HOST_BINARY_NAME"

# Remove the container
echo "[*] Cleaning up..."
sudo docker rm "$CONTAINER_NAME" > /dev/null

echo "[+] Done! Binary saved as $HOST_BINARY_NAME"

pwninit --no-template
