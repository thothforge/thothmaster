#!/usr/bin/env nu

# Load utility modules
source lib/utils.nu
source lib/ui.nu

# Main help message
def help_message [] {
    print "Thothmaster CLI - Workstation Management Tool"
    print ""
    print "Usage:"
    print "  thothmaster <command> [options]"
    print ""
    print "Available commands:"
    print "  install   - Install or update tools and software"
    print "  config    - Configure system settings"
    print "  version   - Show version information"
    print ""
    print "Options:"
    print "  --help, -h  - Show this help message"
    print ""
    print "For help with a specific command, run:"
    print "  thothmaster <command> --help"
}

# Install help message
def install_help_message [] {
    print "Thothmaster CLI - Install Command"
    print ""
    print "Usage:"
    print "  thothmaster install <target> [options]"
    print ""
    print "Available targets:"
    print "  sam         - Install AWS SAM CLI"
    print "  docker      - Install Docker"
    print "  aws-cli     - Install AWS CLI"
    print "  node        - Install Node.js"
    print "  terragrunt  - Install Terragrunt (--version/-v to specify version, defaults to latest)"
    print "  amazon-q    - Install Amazon Q for command line"
    print "  all         - Install all tools"
    print ""
    print "Options:"
    print "  --help, -h  - Show this help message"
    print "  --version, -v <version> - Specify version for tools that support it"
}

# Handle install subcommand
def handle_install [
    target: string
] {
    # Source the install commands only when needed
    source commands/install/sam.nu
    source commands/install/docker.nu
    #source commands/install/aws_cli.nu
    #source commands/install/node.nu
    source commands/install/terragrunt.nu
    source commands/install/amazon_q.nu
    source commands/install/all.nu

    match $target {
        "sam" => { install-sam }
        "docker" => { install-docker }
        "aws-cli" => { install-aws-cli }
        "node" => { install-node }
        "terragrunt" => { install-terragrunt }
        "amazon-q" => { install-amazon-q }
        "all" => { install-all }
        _ => {
            print $"Unknown install target: ($target)"
            install_help_message
        }
    }
}

# Example of another top-level command handler
def handle_config [] {
    print "Config command not implemented yet"
}

# Show version information
def show_version [] {
    print "Thothmaster CLI v1.0.0"
}

# Define the main command
export def main [
    command?: string,   # The command to run
    target?: string,    # The target for the command
    --help (-h),        # Show help
    --version (-v): string  # Version parameter for tools that support it
] {
    if $help {
        help_message
        return
    }

    match $command {
        "install" => {
            if ($target | is-empty) {
                install_help_message
            } else {
                # For terragrunt with version flag
                if $target == "terragrunt" and (not ($version | is-empty)) {
                    source commands/install/terragrunt.nu
                    install-terragrunt --version $version
                } else {
                    # For all other cases
                    handle_install $target
                }
            }
        }
        "config" => { handle_config }
        "version" => { show_version }
        _ => { help_message }
    }
}
