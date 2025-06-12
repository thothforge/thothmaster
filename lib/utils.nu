#!/usr/bin/env nu

# Check if a command exists
export def check-command-exists [command: string] {
    (do { which $command } | length) > 0
}

# Simplified cleanup function that doesn't try to return to original directory
export def safe-cleanup [temp_dir: string] {
    cd /  # Go to a safe directory
    rm -rf $temp_dir
}
