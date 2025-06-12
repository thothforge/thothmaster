#!/usr/bin/env nu

# Import utilities
source ../../lib/utils.nu
source ../../lib/ui.nu

# Terragrunt installation function
export def install-terragrunt [
    --version (-v): string = "latest"  # Terragrunt version to install, "latest" or specific version like "v0.77.22"
] {
    # Check if Terragrunt is already installed
    let terragrunt_exists = (check-command-exists "terragrunt")
    
    # Create a temporary directory without relying on original directory
    let temp_dir = (mktemp -d | str trim)
    
    # Go to the temporary directory
    cd $temp_dir
    
    # Default to linux_amd64 architecture
    let arch = "linux_amd64"
    
    # Determine version to install
    let actual_version = if $version == "latest" {
        echo "Fetching latest Terragrunt version..."
        let latest_release = (http get https://api.github.com/repos/gruntwork-io/terragrunt/releases/latest)
        $latest_release.tag_name
    } else {
        $version
    }
    
    # Download URL
    let download_url = $"https://github.com/gruntwork-io/terragrunt/releases/download/($actual_version)/terragrunt_($arch)"
    
    echo $"Downloading Terragrunt ($actual_version) for ($arch)..."
    http get $download_url | save terragrunt
    
    # Show progress bar
    show-progress-bar 5
    
    echo "Setting executable permissions..."
    chmod u+x terragrunt
    
    if $terragrunt_exists {
        echo "Terragrunt is already installed. Updating to specified version..."
        sudo mv terragrunt /usr/local/bin/terragrunt
        echo $"Terragrunt updated to ($actual_version)!"
    } else {
        echo "Installing Terragrunt..."
        sudo mv terragrunt /usr/local/bin/terragrunt
        echo $"Terragrunt ($actual_version) installation complete!"
    }
    
    # Clean up without trying to return to original directory
    cd /  # Go to a safe directory
    rm -rf $temp_dir
    
    # Verify installation
    echo "Verifying installation..."
    terragrunt --version
}
