export ATUIN_NOBIND="true"
znap source atuinsh/atuin

bindkey '^r' atuin-search

# bind to the up key, which depends on terminal mode
bindkey '^[[A' atuin-up-search
bindkey '^[OA' atuin-up-search
