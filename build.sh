#!/bin/bash

# Atlantr Build Script
# This script builds the Atlantr IMAP checker executable

set -e

echo "======================================"
echo "   Atlantr Build Script"
echo "======================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is not installed"
    exit 1
fi

echo "Python version: $(python3 --version)"
echo ""

# Check if pip is installed
if ! command -v pip3 &> /dev/null; then
    echo "Error: pip3 is not installed"
    exit 1
fi

# Install dependencies
echo "Installing dependencies..."
pip3 install -r requirements.txt

# Install PyInstaller if not already installed
echo "Installing PyInstaller..."
pip3 install pyinstaller

# Clean previous builds
echo "Cleaning previous builds..."
rm -rf build/ dist/

# Build the executable
echo "Building Atlantr executable..."
pyinstaller --clean atlantr.spec

echo ""
echo "======================================"
echo "   Build Complete!"
echo "======================================"
echo ""
echo "The executable can be found in the 'dist' directory:"
ls -lh dist/
echo ""
