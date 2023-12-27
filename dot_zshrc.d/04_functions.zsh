up-line-or-local-history() {
    zle set-local-history 1
    zle up-line-or-history
    zle set-local-history 0
}
zle -N up-line-or-local-history

down-line-or-local-history() {
    zle set-local-history 1
    zle down-line-or-history
    zle set-local-history 0
}
zle -N down-line-or-local-history

import_history() {
	fc -RI
}

no_hist() {
	export HISTFILE=/dev/null 
	echo 'History is disabled'
}

mkcd() { mkdir -p ${@:1:$# - 1} "${@: -1}"; cd "${@: -1}" }

fdo() {
    fd -0 "$@" | xargs -0 nvim -O2
}
fda() {
    fd "$@" | perl -l40pe0
}

safe_source() {
    [[ -s "$1" ]] && source "$1"
}

pg() {
	[[ -z "$PERLBREW_VERSION" ]] && perlbrew_init
	~/bin/pg "$@"
}

perlbrew_init() {
	safe_source "$HOME/perl5/perlbrew/etc/bashrc"
}
#
# Git supports aliases defined in .gitconfig, but you cannot override Git
# builtins (e.g. "git log") by putting an executable "git-log" somewhere in the
# PATH. Also, git aliases are case-insensitive, but case can be useful to create
# a negated command (gf = grep --files-with-matches; gF = grep
# --files-without-match). As a workaround, translate "X" to "-x".

#g() {
#    typeset -r git_alias="git-$1"
#    if `which "$git_alias" >/dev/null 2>&1`; then
#        shift
#        "$git_alias" "$@"
#    elif [[ "$1" =~ [A-Z] ]]; then
#        # Translate "X" to "-x" to enable aliases with uppercase letters. 
#        translated_alias=$(echo "$1" | sed -e 's/[A-Z]/-\l\0/g')
#        shift
#        "$REAL_GIT" "$translated_alias" "$@"
#    else
#        "$REAL_GIT" "$@"
#    fi
#}
#alias git=g
#compdef _git g=git
#compdef _git git=git

cfg_update() {
    if [[ `find .ssh -name 'config*' | wc -l` > 0 ]]; then
        echo "This command will delete your ssh config files, bailing"
        return 1;
    fi
    cfg fetch --all
    cfg reset --hard
    cfg rebase FETCH_HEAD
	# TODO update fzf
    rm .ssh/config*
}

nvl() {
	dir="/Users/martinfrausing/.nvim/sessions"
	command_ex=""
	if [[ ! -z "$1" ]]; then
		command_ex="-q $1"
	fi

	file=`ls $dir | fzf -1 $command_ex`

	if [[ ! -z "$file" ]]; then
		nvim -c "SessionsLoad $dir/$file"
		#nvim -S $dir/$file
	fi
}
ot() {
	pbi
	=ot "$@"
}

tl() {
	dir="/Users/martinfrausing/.tmuxp"
	set -x

	session="$1"
	command_ex="-q $session"

	session=`ls $dir | fzf -1 $command_ex`
	session="${session%.*}"

	is_loaded=$(tmux ls | grep $session)
	if [ -z "$is_loaded"  ]; then
	    tmuxp load -d "$session"
	fi
	tmux -2 -CC attach -d -E -t "$session"
	hs -A -c "hs.window.frontmostWindow():maximize()"
}

#function cnodes_zle() {
#  local selected_host=$(~/src/chef/repo/scripts/cnodes|fzf +m --query "$LBUFFER" --prompt="SSH remote > ")
#  if [ -n "$selected_host" ]; then
#    BUFFER="ssh ${selected_host}"
#    zle accept-line
#  fi
#  zle reset-prompt
#}

function cnodesfzf() {
    ZLE_ENABLED=1
    if [[ "${0}" == cnodesfzf ]]; then
	ZLE_ENABLED=0
    fi

    local selected_host=$({~/src/chef/repo/scripts/cnodes & awk '{print $1}' ~/.ssh/known_hosts; }|sort|uniq|fzf +m --query "$LBUFFER" --prompt="SSH remote > " --color "prompt:#89b4fa")
    if [ -n "$selected_host" ]; then
	if [ -n "$TMUX" ]; then
	    WINDOWNAME=$(echo ${selected_host}|cut -d . -f1)
	    tmux rename-window -t work "${WINDOWNAME}"
	elif [ -n "$ZELLIJ" ]; then
	    zellij action rename-pane "${selected_host}"
	fi
	BUFFER="ssh ${selected_host}"
	if [[ ${ZLE_ENABLED} -eq 1 ]]; then
	    zle accept-line
	else
	    eval ${BUFFER}
	fi
    fi
    if [[ ${ZLE_ENABLED} -eq 1 ]]; then
	zle reset-prompt
    fi
}

zle -N cnodesfzf
bindkey '^X' cnodesfzf

set_iterm_name() {
  mode=$1; shift
  echo -ne "\033]$mode;$@\007"
}
iterm_tab () { set_iterm_name 1 $@; }

function get_password() {
    LEN="${1:-36}"
    pwgen -y $LEN -1 -c -n
}

function sushi_ssh() {
    sushi "$@" && ssh "$@"
}
