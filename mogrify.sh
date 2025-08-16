#!/bin/bash

# A script to RECURSIVELY resize all images of a specific type in the
# current directory and all subdirectories using ImageMagick's mogrify.

TARGET_GEOMETRY="$1"
FILE_EXTENSION="$2"

# --- Pre-flight Checks ---

if ! command -v mogrify &> /dev/null; then
    echo "Error: ImageMagick is not installed." >&2
    exit 1
fi

if [[ -z "$TARGET_GEOMETRY" || -z "$FILE_EXTENSION" ]]; then
    echo "Usage: ./resize-recursive.sh <geometry> <extension>"
    echo "Example: ./resize-recursive.sh 1920x jpg"
    exit 1
fi

# Recursively find the number of files that will be affected
FILE_COUNT=$(find . -type f -iname "*.${FILE_EXTENSION}" | wc -l)

if [ "$FILE_COUNT" -eq 0 ]; then
    echo "No files found with the extension '.${FILE_EXTENSION}' recursively."
    exit 0
fi

# --- Confirmation ---
echo "WARNING: This will find and overwrite ${FILE_COUNT} '.${FILE_EXTENSION}' file(s)"
echo "in the current directory AND ALL SUBDIRECTORIES."
read -p "Are you sure you want to resize them to '${TARGET_GEOMETRY}'? (y/n) " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Operation cancelled."
    exit 1
fi

# --- Execution ---
echo "Finding and resizing images..."
find . -type f -iname "*.${FILE_EXTENSION}" -exec mogrify -resize "$TARGET_GEOMETRY" {} +

echo "Done. Attempted to resize ${FILE_COUNT} files."