HOSTNAME=`hostname`
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

export BLOCKSIZE=K;
export PAGER=less;
export LESS='-RQ'
export DELTA_PAGER="less $LESS"

export PS1="%*:%n@%m:%~%{${fg[red]}%}%B%(?..(%?%))%b%#";

export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/gnu-sed/libexec/gnubin:/opt/homebrew/opt/make/libexec/gnubin:/opt/homebrew/opt/ruby/bin:/sbin:/usr/local/bin:/bin:/usr/sbin:/usr/bin:/opt/src:$HOME/bin:/usr/local/sbin:/usr/local/bin:$HOME/.startups:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/install_src/git-fuzzy/bin:/opt/homebrew/Cellar/perl/5.34.0/bin:/opt/homebrew/Library/Homebrew/shims/gems

export SSH_REAL_HOST=`hostname`

export LANG=en_GB.UTF-8
export LC_TIME=en_GB.UTF-8
export LC_PAPER=en_GB.UTF-8
export LC_MESSAGES=en_GB.UTF-8
export LC_CTYPE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

export EMAIL=fra@one.com
export NAME="Martin Frausing"

export DISABLE_AUTO_TITLE=true

#colours for ls in solarised urxvt
export TERM=xterm-256color
export CLICOLOR=1

export VIRTUAL_ENV_DISABLE_PROMPT=true

if $(which nvim > /dev/null); then
    export EDITOR=nvim
else
    export EDITOR=vim
fi

if [[ -z "$REAL_GIT" ]]; then
    export REAL_GIT=`which git`
fi

PERL5LIB="~/local"

unset TMOUT

export BAT_THEME="Solarized (light)"
