return {
  'rhysd/committia.vim',
--  lazy = false,
--  init = function()
--    vim.g.committia_hooks = {}
--    vim.cmd [[
--      let g:committia_hooks = {}
--      function! g:committia_hooks.edit_open(info)
--              " Additional settings
--              setlocal spell
--
--              " If no commit message, start with insert mode
--              if a:info.vcs ==# 'git' && getline(1) ==# ''
--                      startinsert
--              end
--
--              " Scroll the diff window from insert mode
--              " Map PageDown/Up
--              imap <buffer><PageDown> <Plug>(committia-scroll-diff-down-half)
--              imap <buffer><PageUp> <Plug>(committia-scroll-diff-up-half)
--      endfunction
--    ]]
--  end,
}

