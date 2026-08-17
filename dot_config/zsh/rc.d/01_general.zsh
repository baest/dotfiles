bindkey -v
#see zsh manual p 170
bindkey '\eq' push-line-or-edit
bindkey -M vicmd 'q' push-line-or-edit
#function backward-kill-line_mine() {
#    backward-kill-line
#    autosuggest-clear
#    print "done"
#}
#bindkey '^U' backward-kill-line_mine
bindkey '^U' backward-kill-line

autoload -U compinit; compinit -iC

#https://github.com/Phantas0s/.dotfiles/blob/master/zsh/completion.zsh
#_comp_options+=(globdots) # With hidden files

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

bindkey -M menuselect '^xg' clear-screen
bindkey -M menuselect '^xi' vi-insert                      # Insert
bindkey -M menuselect '^xh' accept-and-hold                # Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  # Next
bindkey -M menuselect '^xu' undo                           # Undo
bindkey -M menuselect '\e'  send-break			   # close menu

# new stuff copied
# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

# +---------+
# | zstyles |
# +---------+

# Ztyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate

# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' complete true

zle -C alias-expension complete-word _generic
bindkey '^Xa' alias-expension
zstyle ':completion:alias-expension:*' completer _expand_alias

# Use cache for commands which use it

# Allow you to select in a menu
zstyle ':completion:*' menu select

# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true

# very annoying, but probably nice for nv
#zstyle ':completion:*' file-sort modification

zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# Colors for files and directory
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
# zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases

# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''

zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# See ZSHCOMPWID "completion matching control"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' keep-prefix true

# The following example sets special-dirs to ‘..’ when the current prefix is empty, is a single ‘.’, or consists only of a path beginning with ‘../’. Otherwise the value is ‘false’.
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

#old stuff disabled
# # _history
# zstyle ':completion:*' completer _expand _complete _correct _list
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' use-perl 1
# #zstyle :compinstall filename '/home/.zshrc'
#
# zstyle ':completion:*' special-dirs true
#
# # Highlight the current autocomplete option
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

setopt NOBEEP
setopt AUTO_CD
setopt CORRECT
unsetopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt CHASE_LINKS
setopt AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt AUTO_REMOVE_SLASH
setopt NULL_GLOB
setopt EXTENDED_GLOB
setopt extendedglob
setopt GLOBSTARSHORT
setopt no_complete_aliases

#limit coredumpsize 0
autoload zkbd zmv zcalc help
#zargs#zmv 
autoload zsh/mathfunc
autoload -U select-word-style

select-word-style bash
