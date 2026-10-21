export EMPTY_ENTER_EXPANDER_MODULE_PATH="$HOME/.config/empty-enter-expander"
znap source waszabi/empty-enter-expander
zle -N empty-enter-expander
bindkey "^M" empty-enter-expander
