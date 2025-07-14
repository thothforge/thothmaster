#!/usr/bin/env nu

# Import utilities
source ../../lib/utils.nu
source ../../lib/ui.nu

# Install Amazon Q for Ubuntu
export def install-amazon-q [] {
    print "Installing Amazon Q for Ubuntu..."
    
    # Create a temporary directory
    let temp_dir = (mktemp -d | str trim)
    let original_dir = (pwd)
    
    # Go to the temporary directory
    cd $temp_dir
    
    # Download the latest Amazon Q .deb package
    print "Downloading Amazon Q..."
    run-external "wget" "https://desktop-release.q.us-east-1.amazonaws.com/latest/amazon-q.deb" "-O" "amazon-q.deb"
    
    if not ($env.LAST_EXIT_CODE == 0) {
        print "Error downloading Amazon Q"
        safe-cleanup $temp_dir
        return
    }
    
    # Install dependencies
    print "Installing dependencies..."
    sudo apt-get install -f -y
    
    if not ($env.LAST_EXIT_CODE == 0) {
        print "Error installing dependencies"
        safe-cleanup $temp_dir
        return
    }
    
    # Install the .deb package
    print "Installing Amazon Q package..."
    sudo dpkg -i amazon-q.deb
    
    if not ($env.LAST_EXIT_CODE == 0) {
        print "Error installing Amazon Q"
        safe-cleanup $temp_dir
        return
    }
    
    print "Amazon Q has been successfully installed!"
    print "You can launch it by running: q"
    
    # Clean up temporary directory
    print "Cleaning up temporary files..."
    safe-cleanup $temp_dir
}
