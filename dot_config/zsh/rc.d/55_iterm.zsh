if [[ ! -z "$ITERM_SESSION_ID" ]]; then
    safe_source "$HOME/.iterm2_shell_integration.zsh"
    #[[ ! -f ~/.zgen/.iterm2_shell_integration.zsh ]] || source ~/.zgen/.iterm2_shell_integration.zsh

    #export PS1="$PS1%{$(iterm2_prompt_mark)%}"
fi
