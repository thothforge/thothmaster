#!/usr/bin/env nu

# Install Amazon Q for Ubuntu
export def install-amazon-q [] {
    print "Installing Amazon Q for Ubuntu..."
    
    # Download the latest Amazon Q .deb package
    print "Downloading Amazon Q..."
    run-external "wget" "https://desktop-release.q.us-east-1.amazonaws.com/latest/amazon-q.deb" "-O" "amazon-q.deb"
    
    if not ($env.LAST_EXIT_CODE == 0) {
        print "Error downloading Amazon Q"
        return
    }
    
    # Install dependencies
    print "Installing dependencies..."
    sudo apt-get install -f -y
    
    if not ($env.LAST_EXIT_CODE == 0) {
        print "Error installing dependencies"
        return
    }
    
    # Install the .deb package
    print "Installing Amazon Q package..."
    sudo dpkg -i amazon-q.deb
    
    if not ($env.LAST_EXIT_CODE == 0) {
        print "Error installing Amazon Q"
        return
    }
    
    print "Amazon Q has been successfully installed!"
    print "You can launch it by running: q"
}
