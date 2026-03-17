export ATUIN_NOBIND="true"
znap source atuinsh/atuin

znap eval atuin 'atuin hex init'


# bind to the up key, which depends on terminal mode
bindkey -M viins '^[[A' atuin-up-search
bindkey -M viins '^[OA' atuin-up-search
zvm_bindkey viins '^[[A' atuin-up-search
zvm_bindkey viins '^[OA' atuin-up-search

bindkey -M viins '^R' atuin-search
zvm_bindkey viins '^R' atuin-search
