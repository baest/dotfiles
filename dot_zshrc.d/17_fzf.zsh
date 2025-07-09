export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
zstyle ':autocomplete:*' fzf-completion yes
zstyle ':autocomplete:*' min-input 2

znap source junegunn/fzf shell/{completion,key-bindings}.zsh
