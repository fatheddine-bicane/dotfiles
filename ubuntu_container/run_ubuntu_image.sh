#!/bin/bash

# Stop script immediately on error
set -e

# Build the image from the current directory (.)
docker build -t ubuntu_dev .

# Run the container with the "Mirror Mount" strategy
docker run -it \
    --rm \
    -v "$HOME:$HOME" \
    -w "$(pwd)" \
    ubuntu_dev


echo "--- Container is ready !---"
