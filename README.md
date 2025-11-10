# Dotfiles

My personal configuration files for development environment setup.

## Overview

This repository contains my dotfiles and configuration files for various tools and applications. These configurations are optimized for my workflow and preferences.

## Contents

- **Shell Configuration**
  - `.bashrc` / `.zshrc` - Shell configuration
  - `.bash_profile` / `.zprofile` - Login shell configuration
  - Custom shell functions and aliases

- **Editor Configuration**
  - Neovim (`nvim/`) - Editor configuration and plugins
  - VSCode (`vscode/`) - Editor settings and extensions

- **Terminal**
  - Ghostty (`ghostty/`) - Terminal emulator configuration
  - Tmux (`.tmux.conf`) - Terminal multiplexer settings

- **Version Control**
  - Git (`.gitconfig`) - Git configuration and aliases
  - `.gitignore_global` - Global gitignore patterns

- **Development Tools**
  - Language-specific configurations (Node, Python, etc.)
  - Build tool configurations

## Installation

### Prerequisites

- Git
- [List any other required tools]

### Quick Install

```bash
# Clone the repository
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Run the installation script
./install.sh
```

### Manual Installation

If you prefer to install configurations manually:

```bash
# Link shell configuration
ln -s ~/dotfiles/.zshrc ~/.zshrc

# Link Neovim configuration
ln -s ~/dotfiles/nvim ~/.config/nvim

# Link Git configuration
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

# Add additional symlinks as needed
```

## System-Specific Configuration

Some configurations may need adjustments for different systems:

- **macOS**: [Specific instructions or configurations]
- **Linux**: [Specific instructions or configurations]
- **Windows/WSL**: [Specific instructions or configurations]

## Customization

To customize these dotfiles for your own use:

1. Fork this repository
2. Clone your fork
3. Modify configurations to match your preferences
4. Update this README with your specific setup

## Key Features

- **Shell Enhancements**: Custom aliases, functions, and prompt configuration
- **Editor Setup**: Optimized Neovim configuration with language server support
- **Git Workflow**: Useful aliases and configurations for daily Git operations
- **Theme Consistency**: Matching color schemes across terminal, editor, and tools

## Dependencies

List of tools and applications these dotfiles are configured for:

- Neovim (>= 0.9.0)
- Git (>= 2.0)
- [Tool name] (version)
- [Add all relevant tools]

## Themes

Current theme setup:
- **Terminal**: [Theme name based on Fish shell theme]
- **Editor**: Custom theme matching terminal colors
- **Color Scheme**: Orange/gold accent colors with dark background

## Backup

Before installing, it's recommended to backup your existing configurations:

```bash
# Backup existing dotfiles
mkdir ~/dotfiles_backup
cp ~/.zshrc ~/dotfiles_backup/
cp ~/.gitconfig ~/dotfiles_backup/
# Add other files as needed
```

## Scripts

### `install.sh`
Automated installation script that creates symlinks for all configuration files.

### `backup.sh`
Creates a backup of current configurations before installing.

### `update.sh`
Pulls the latest changes from the repository and updates symlinks.

## Troubleshooting

**Issue**: Symlinks not working
- **Solution**: Ensure the source files exist and paths are correct

**Issue**: Shell not loading configuration
- **Solution**: Check that `.zshrc` or `.bashrc` is being sourced in your profile

**Issue**: Colors not displaying correctly
- **Solution**: Ensure your terminal supports true color (24-bit color)

## Maintenance

To keep your dotfiles in sync across machines:

```bash
# Pull latest changes
cd ~/dotfiles
git pull

# Commit local changes
git add .
git commit -m "Update configurations"
git push
```

## Resources

- [Dotfiles Guide](https://dotfiles.github.io/)
- [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles)
- [Your other favorite resources]

## License

This repository is licensed under the MIT License - feel free to use and modify as needed.

## Acknowledgments

Inspired by and borrowed from:
- [User/Repo] - [What you borrowed]
- [Community/Resource] - [Inspiration]

## Contact

- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your.email@example.com

---

**Note**: These dotfiles are personalized for my workflow. Feel free to use them as a starting point, but you may need to adjust configurations to match your preferences and system setup.
