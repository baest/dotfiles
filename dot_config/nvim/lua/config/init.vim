" Consider:
" https://github.com/junegunn/tmux-complete.vim
" https://github.com/tomtom/tcomment_vim


" Help
"  :perldo s/searchme/replaceme/g
"  :%!perl -pi -e 's/<text>/\n/'

"  when writing searches with /... use ctrl+r, ctrl+w to get the word under the cursor copied to the search terms

"  % jumps to the other part of a () {} []...

"  ctrl+x-ctrl+f for autocomplete filenames
"  ctrl+x-ctrl+u for autocomplete whatever visible inside tmux panel
"
"  if you want to join without inserting spaces, do gJ

"  delete line match abe
"  :g/abe/d

" paste in insert mode
" ctrl+o p (ctrl exits insert mode for one command)
" ctrl-R " (ctrl-R can be used with other registers than ")
"
" Setting stuff in all windows/tabs at once
" :tabdo windo set number


" general options
"set tabstop=4
"set shiftwidth=4
set noexpandtab
function! Copy() range
	echo system('cat '. expand('%:p') .'| xclip -selection c')
endfunction
map <leader>pb :call Copy()
vnoremap <leader>pb :!xclip -selection c<cr>u
noremap <leader>v o<cr>:set paste<cr>:.!pbpaste<cr>:set nopaste<cr>

"....

set t_Co=256                        " force vim to use 256 colors
"vim-colors-solarized
set background=light

"committia
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
	" Additional settings
	setlocal spell

	" If no commit message, start with insert mode
	if a:info.vcs ==# 'git' && getline(1) ==# ''
		startinsert
	end

	" Scroll the diff window from insert mode
	" Map PageDown/Up
	imap <buffer><PageDown> <Plug>(committia-scroll-diff-down-half)
	imap <buffer><PageUp> <Plug>(committia-scroll-diff-up-half)
endfunction

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

autocmd FileType perl,mason ab P use DDP; p
"autocmd FileType perl,mason ab P use Data::Dumper; warn Dumper(
autocmd FileType sql set expandtab

" don't indent comments
set indentkeys-=0#
"autocmd BufNewFile,BufReadPost * if &filetype == "python" |  | endif
"autocmd BufNewFile,BufReadPost * if &filetype == "yaml" | set expandtab shiftwidth=2 indentkeys-=0# | endif
