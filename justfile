default:
	@just --list

# update submodules
submodules:
	git submodule update --remote --recursive --merge
	git submodule foreach 'git checkout main && git pull origin main'

# create symlinks
stow:
	mkdir -p ~/.config
	stow -d home -t ~ --verbose --dotfiles .

# remove symlinks
unstow:
	stow -d home -t ~ --verbose --dotfiles -D .
