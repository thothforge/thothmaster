#!/usr/bin/env nu

# Import all command modules
source ../install/sam.nu
source ../install/docker.nu
source ../install/terragrunt.nu
source ../install/amazon_q.nu
#source commands/install/aws_cli.nu
#source commands/install/node.nu

# Install all tools
export def install-all [] {
    echo "Installing all tools..."
    install-sam
    install-docker
    install-terragrunt
    install-amazon-q
    #install-aws-cli
    #install-node
    echo "All tools installed successfully!"
}
