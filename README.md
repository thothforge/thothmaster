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

## Usage

```bash
./thothmaster.nu <command> [options]
```

### Available Commands

- `install` - Install or update tools and software
- `config` - Configure system settings
- `version` - Show version information

### Install Command

```bash
./thothmaster.nu install <target> [options]
```

#### Available Targets

- `sam` - Install AWS SAM CLI
- `docker` - Install Docker
- `aws-cli` - Install AWS CLI (not implemented yet)
- `node` - Install Node.js (not implemented yet)
- `terragrunt` - Install Terragrunt
- `all` - Install all tools

#### Options

- `--version, -v <version>` - Specify version for tools that support it (currently only terragrunt)

## Examples

Install the latest version of Terragrunt:
```bash
./thothmaster.nu install terragrunt
```

Install a specific version of Terragrunt:
```bash
./thothmaster.nu install terragrunt --version v0.77.22
```

Install all available tools:
```bash
./thothmaster.nu install all
```

## Project Structure

- `thothmaster.nu` - Main entry point
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
