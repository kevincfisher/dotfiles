# Neovim Configuration

My personal Neovim configuration, scavenged from various sources that all know what they're doing better than I do.

## Features

- Native LSP configuration using `vim.lsp.config()` and `vim.lsp.enable()`
- Treesitter for enhanced syntax highlighting and code understanding
- Fuzzy finding and file navigation
- Copilot integration
- Autocompletion and snippets
- Cool theme

## Installation

Clone the repository:

```bash
git clone https://github.com/kevincfisher/dotfiles.git ~/dotfiles
```

Create a symlink to your Neovim config directory:

```bash
ln -s ~/dotfiles/nvim ~/.config/nvim
```

Open Neovim and let the plugin manager install dependencies:

```bash
nvim
```

## Requirements

- Neovim >= 0.10.0
- Git
- A Nerd Font (for icons)
- ripgrep (for telescope grep functionality)

## Structure

```
nvim/
├── init.lua           # Entry point
├── lua/
│   ├── config/        # General configuration
│   └── plugins/       # Plugin specifications
```

## Customization

Managed with [lazy.nvim](https://github.com/folke/lazy.nvim). Add or modify plugins in the `lua/plugins/` directory as needed.
