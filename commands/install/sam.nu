#!/usr/bin/env nu

# Import utilities
source ../../lib/utils.nu
source ../../lib/ui.nu

# SAM CLI installation function
export def install-sam [] {
    # Check if SAM is already installed
    let sam_exists = (check-command-exists "sam")

    # Create a temporary directory
    let temp_dir = (mktemp -d | str trim)
    cd $temp_dir

    # Common steps for both install and update
    echo "Downloading AWS SAM CLI installer..."
    http get https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip | save aws-sam-cli.zip

    echo "Extracting installer..."
    unzip -q aws-sam-cli.zip -d sam-installation

    # Show progress bar
    show-progress-bar 10

    cd sam-installation

    if $sam_exists {
        echo "AWS SAM CLI is already installed. Updating to latest version..."
        sudo ./install --update
        echo "AWS SAM CLI update complete!"
    } else {
        echo "Installing AWS SAM CLI..."
        sudo ./install
        echo "AWS SAM CLI installation complete!"
    }

    # Clean up without trying to return to original directory
    cd /  # Go to a safe directory
    rm -rf $temp_dir

    # Verify installation
    echo "Verifying installation..."
    sam --version
}
