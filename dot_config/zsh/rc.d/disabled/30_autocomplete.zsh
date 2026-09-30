znap source marlonrichert/zsh-autocomplete
# This makes ← and → always move the cursor on the command line, even when you are in the menu:
bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char

# This will make Autocomplete behave as if you pressed CtrlR at the start of each new command line:
zstyle ':autocomplete:*' default-context history-incremental-search-backward

# Override default for all listings
# $LINES is the number of lines that fit on screen.
zstyle -e ':autocomplete:*:*' list-lines 'reply=( $(( LINES / 3 )) )'

#This makes Enter always submit the command line, even when you are in the menu:
bindkey -M menuselect '^M' .accept-line

#Autocomplete overrides the behavior of some of Zsh's built-in keyboard widgets. To use the original widget instead, prefix it with a . (this is atuin though)
bindkey '^R' .history-incremental-search-backward
bindkey '^S' .history-incremental-search-forward
