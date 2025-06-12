#!/usr/bin/env nu

# Install Amazon Q for Ubuntu
export def install-amazon-q [] {
    print "Installing Amazon Q for Ubuntu..."
    
    # Download the latest Amazon Q .deb package
    print "Downloading Amazon Q..."
    let download_result = (run-external "wget" "https://desktop-release.q.us-east-1.amazonaws.com/latest/amazon-q.deb" "-O" "amazon-q.deb")
    
    if $download_result.exit_code != 0 {
        print $"Error downloading Amazon Q: ($download_result.stderr)"
        return
    }
    
    # Install dependencies
    print "Installing dependencies..."
    let deps_result = (run-external --sudo "apt-get" "install" "-f" "-y")
    
    if $deps_result.exit_code != 0 {
        print $"Error installing dependencies: ($deps_result.stderr)"
        return
    }
    
    # Install the .deb package
    print "Installing Amazon Q package..."
    let install_result = (run-external --sudo "dpkg" "-i" "amazon-q.deb")
    
    if $install_result.exit_code != 0 {
        print $"Error installing Amazon Q: ($install_result.stderr)"
        return
    }
    
    print "Amazon Q has been successfully installed!"
    print "You can launch it by running: q"
}
