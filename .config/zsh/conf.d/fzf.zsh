#/usr/bin/env zsh

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# Override default fzf command to use fd
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hideen --strip-cwd-prefix --exclude .git"

# override path and dir completion commands: https://github.com/junegunn/fzf?tab=readme-ov-file#customizing-completion-source-for-paths-and-directories
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

#checks whether the highlighted file is a directory, then calls either eza (dir) or bat (file)
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200 ; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

#Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}
