#!/bin/bash
set -e  # Exit on error

RGBDS_DIR="rgbds"
URL="https://github.com/gbdev/rgbds/releases/download/v0.6.1/rgbds-0.6.1-win64.zip"
ZIP_FILE="rgbds-0.6.1-win64.zip"

# Function to check dependencies
check_dep() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "Error: '$1' is not installed."
        echo "Please install it and rerun this script."
        exit 1
    fi
}

echo "Checking dependencies..."
check_dep curl
check_dep unzip
echo "All dependencies are installed."

# Create target directory if it doesn't exist
mkdir -p "$RGBDS_DIR"

# Download the zip file if not already downloaded
if [ ! -f "$ZIP_FILE" ]; then
    echo "Downloading RGBDS 0.6.1..."
    curl -L -o "$ZIP_FILE" "$URL"
else
    echo "ZIP file already exists, skipping download."
fi

# Extract the zip into rgbds directory
echo "Extracting to $RGBDS_DIR/..."
unzip -o "$ZIP_FILE" -d "$RGBDS_DIR"

# Delete the zip file to save space
echo "Cleaning up..."
rm -f "$ZIP_FILE"

echo "Done! RGBDS is installed in '$RGBDS_DIR' and the zip file has been removed."
