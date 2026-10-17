zstyle ':zephyr:plugin:*' 'use-cache'

zstyle ':zephyr:plugin:prompt' 'theme' 'starship'

zstyle ':zephyr:plugin:completion' 'use-cache' 'yes'
zstyle ':zephyr:plugin:completion' 'use-xdg-basedirs' 'yes'

zstyle ':zephyr:plugin:editor' key-bindings 'existing'
zstyle ':zephyr:plugin:editor' magic-enter yes
zstyle ':zephyr:plugin:editor:magic-enter' command 'eza -laagH --git'
zstyle ':zephyr:plugin:editor:magic-enter' jj-command 'jj'

###

zstyle ':antidote:*' zcompile 'yes'
