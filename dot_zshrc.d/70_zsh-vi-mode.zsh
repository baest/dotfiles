zvm_config() {
    ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
}

zvm_after_lazy_keybindings_commands() {
    bindkey -M viins '^[[A' atuin-up-search
    bindkey -M viins '^[OA' atuin-up-search

    bindkey -M viins '^R' atuin-search

}
znap source jeffreytse/zsh-vi-mode
zvm_bindkey viins '^R' atuin-search
zvm_bindkey vicmd '^R' atuin-search
#TODO this doesn't work
