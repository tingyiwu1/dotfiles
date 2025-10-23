#!/bin/bash

# Directory to store cache
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/apropos"
CACHE_FILE="$CACHE_DIR/apropos_output.txt"

# Create cache directory if it doesn't exist
mkdir -p "$CACHE_DIR"

# Check if cache exists and is less than 1 day old
if [[ -f "$CACHE_FILE" ]]; then
    current_time=$(date +%s)
    file_time=$(stat -f%m "$CACHE_FILE" 2>/dev/null)
    age=$((current_time - file_time))
    
    cat "$CACHE_FILE"
    
    # If cache expired, regenerate it in background
    if (( age >= 86400 )); then
        (apropos . > "$CACHE_FILE.tmp" 2>/dev/null && mv "$CACHE_FILE.tmp" "$CACHE_FILE") &
    fi
    exit 0
fi

# Cache doesn't exist, generate it
apropos . | tee "$CACHE_FILE"
