alias ls="ls -F"
#alias ll="ls -alh"

if `which eza &> /dev/null`; then 
	alias ll="eza -laagH --git"
	#alias ll="exa -laag --git --grid"
	alias tree="eza --tree -laagH --git"
elif `which exa &> /dev/null`; then 
	alias ll="exa -laagH --git"
	#alias ll="exa -laag --git --grid"
	alias tree="exa --tree -laagH --git"
else
	alias ll="ls -alh"
	alias tree="tree -a"
fi

alias cls="echo -ne '\033c'"

alias dc=cd
#alias fd=/usr/bin/fdfind
alias zudo="sudo zsh"
alias top="top -c"
alias 1='cd ..'
alias 2='cd ../..'
alias 3='cd ../../..'
alias 4='cd ../../../..'
alias 5='cd ../../../../..'
alias 6='cd ../../../../../..'
alias a=attach

# tig
alias tigs="tig status"
alias tigb="tig blame"

# cfg
alias cfg="$REAL_GIT --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# nvim
if [[ -z "$(which nvim 2> /dev/null)" ]]; then
	alias nv=vim
	alias damnit='vim $(git grep -l "<<<< HEAD")'
else
	alias nvs='NVIM_APPNAME="nvim-own" nvim -On'
	alias nv2='NVIM_APPNAME="nvim-own" nvim -O2'
	alias nvk='NVIM_APPNAME="nvim-kickstart" nvim'
	alias nv='NVIM_APPNAME="nvim-own" nvim'
	alias nvold=nvim
	alias damnit='NVIM_APPNAME="nvim-own" nvim $(git grep -l "<<<< HEAD")'
fi
alias pbi=perlbrew_init
if `which thefuck > /dev/null 2>&1`; then
	eval $(thefuck --alias)
fi

alias bc="figlet 'use squiid' && sleep 2 && squiid"
alias fend="figlet 'use squiid' && sleep 2 && squiid"

alias unhex="xxd -r -p"
alias hex="xxd -p -c0 -u"
alias gs=forgit::checkout::branch

# from-decimal
alias d2h="perl -e 'printf qq|%X\n|, int( shift )'"
alias d2o="perl -e 'printf qq|%o\n|, int( shift )'"
alias d2b="perl -e 'printf qq|%b\n|, int( shift )'"
# from-hex
alias h2d="perl -e 'printf qq|%d\n|, hex( shift )'"
alias h2o="perl -e 'printf qq|%o\n|, hex( shift )'"
alias h2b="perl -e 'printf qq|%b\n|, hex( shift )'"
# from-octal
alias o2h="perl -e 'printf qq|%X\n|, oct( shift )'"
alias o2d="perl -e 'printf qq|%d\n|, oct( shift )'"
alias o2b="perl -e 'printf qq|%b\n|, oct( shift )'"
# from-binary
alias b2h="perl -e 'printf qq|%X\n|, oct( q|0b| . shift )'"
alias b2d="perl -e 'printf qq|%d\n|, oct( q|0b| . shift )'"
alias b2o="perl -e 'printf qq|%o\n|, oct( q|0b| . shift )'"

alias cm=chezmoi

alias jjpull="jj git fetch && jj rebase -d 'trunk()'"
