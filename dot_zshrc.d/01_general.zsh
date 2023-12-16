bindkey -e
#see zsh manual p 170
bindkey '\eq' push-line-or-edit
bindkey '^U' backward-kill-line

autoload -Uz compinit
compinit -i

# _history
zstyle ':completion:*' completer _expand _complete _correct _list
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' use-perl 1
zstyle :compinstall filename '/home/.zshrc'

zstyle ':completion:*' special-dirs true

# Highlight the current autocomplete option
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

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

limit coredumpsize 0
autoload zkbd zmv zcalc help
#zargs#zmv 
autoload zsh/mathfunc
autoload -U select-word-style

select-word-style bash
