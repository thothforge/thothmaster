# Thothmaster CLI

Thothmaster is a command-line tool for managing developer workstations, focusing on installing and configuring common development tools.

## Features

- Install and update development tools
- Configure system settings
- Simple and consistent interface

## Installation

Clone this repository and make the main script executable:

```bash
git clone https://github.com/yourusername/thothmaster.git
cd thothmaster
chmod +x thothmaster.nu
```

To make Thothmaster accessible from anywhere in your system (requires Nushell):

```bash
# Option 1: Create a symbolic link in /usr/local/bin (requires sudo)
sudo ln -sf /path/to/thothmaster/thothmaster.nu /usr/local/bin/thothmaster

# Option 2: Create a symbolic link in your user's bin directory
mkdir -p ~/bin
ln -sf /path/to/thothmaster/thothmaster.nu ~/bin/thothmaster
```

Make sure your `~/bin` directory is in your PATH if using Option 2.

## Usage

```bash
thothmaster <command> [options]
```

Or if running directly from the installation directory:

```bash
./thothmaster.nu <command> [options]
```

### Available Commands

- `install` - Install or update tools and software
- `config` - Configure system settings
- `version` - Show version information

### Install Command

```bash
thothmaster install <target> [options]
```

#### Available Targets

- `sam` - Install AWS SAM CLI
- `docker` - Install Docker
- `aws-cli` - Install AWS CLI (not implemented yet)
- `node` - Install Node.js (not implemented yet)
- `terragrunt` - Install Terragrunt
- `amazon-q` - Install Amazon Q for command line
- `all` - Install all tools

#### Options

- `--version, -v <version>` - Specify version for tools that support it (currently only terragrunt)

## Examples

Install the latest version of Terragrunt:
```bash
thothmaster install terragrunt
```

Install a specific version of Terragrunt:
```bash
thothmaster install terragrunt --version v0.77.22
```

Install Amazon Q for command line:
```bash
thothmaster install amazon-q
```

Install all available tools:
```bash
thothmaster install all
```

## Project Structure

- `thothmaster.nu` - Main entry point
- `main.nu` - Core functionality
- `lib/` - Utility functions
  - `utils.nu` - General utilities
  - `ui.nu` - UI-related functions
- `commands/` - Command implementations
  - `install/` - Installation scripts for various tools

## Requirements

- [Nushell](https://www.nushell.sh/) - The shell used for the scripts
- Internet connection for downloading tools
- Sudo privileges for installing tools system-wide

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
