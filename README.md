# Dotfiles

These are my personal dotfiles cobbled together from various sources of inspiration. Tailored to me, probably will not work for you. Uses GNU Stow to manage symlinks

## Structure

```
dotfiles/
├── .config/          # Config files for ~/.config
│   ├── nvim/
│   ├── zsh/
│   └── tmux/
├── home/             # Config files for ~/
│   ├── .gitconfig
│   └── .zshenv
├── install.sh        # Install dotfiles
├── uninstall.sh      # Remove dotfiles
├── backup.sh         # Backup existing configs
└── README.md
```

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)

Install on macOS:
```bash
brew install stow
```

Install on Linux:
```bash
# Debian/Ubuntu
sudo apt install stow

# Arch
sudo pacman -S stow

# Fedora
sudo dnf install stow
```

## Installation

### First Time Setup

1. Clone this repository:
```bash
git clone git@github.com/kevincfisher/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. (Optional) Backup your existing configs:
```bash
./backup.sh
```

3. Install dotfiles:
```bash
./install.sh
```

This will create symlinks:
- `~/.config/nvim` → `~/dotfiles/.config/nvim`
- `~/.config/zsh` → `~/dotfiles/.config/zsh`
- `~/.gitconfig` → `~/dotfiles/home/.gitconfig`
- etc.

> NOTE: in order for zsh to bootstrap properly, you should ensure you have a minimal .zshenv file in your $HOME directory with the following:
```bash
export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}
```
I'm too stupid to come up with an alternative at the moment but this does the trick
 
## Usage

### Install dotfiles
```bash
./install.sh
```

### Remove symlinks
```bash
./uninstall.sh
```

### Backup existing configs
```bash
./backup.sh
```
Creates a timestamped backup in `~/.config.bak_<timestamp>/`

## How It Works

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks. Stow creates symlinks from your home directory to files in this repository.

- Files in `.config/` are symlinked to `~/.config/`
- Files in `home/` are symlinked to `~/`

This allows you to:
- Keep all configs in one place
- Version control your dotfiles with git
- Easily sync configs across machines
- Quickly install/uninstall configurations

## Adding New Configs

### For ~/.config files
```bash
# Move existing config
mv ~/.config/myapp ~/dotfiles/.config/

# Reinstall
./uninstall.sh
./install.sh
```

### For ~/ files
```bash
# Move existing dotfile
mv ~/.myconfig ~/dotfiles/home/.myconfig

# Reinstall
./uninstall.sh
./install.sh
```

## Troubleshooting

### Stow conflicts
If stow reports conflicts, you likely have existing files. Either:
1. Back them up with `./backup.sh`
2. Manually remove or move the conflicting files
3. Run `./install.sh` again

### Broken symlinks
If you move the dotfiles directory, symlinks will break. Run:
```bash
./uninstall.sh
./install.sh
```

## License

Personal dotfiles - use at your own risk!
