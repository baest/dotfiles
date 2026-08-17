#znap fpath _doggo 'doggo completions zsh'
(( $+commands[jj] )) && znap fpath _jj    'jj util completion zsh'
znap eval complete 'COMPLETE=zsh jj'
(( $+commands[layerx] )) && znap fpath _layerx 'layerx completion zsh'
