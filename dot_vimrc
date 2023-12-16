
"set term=$TERM
"source /usr/local/share/vim/vim63/ftplugin/man.vim

":perldo s/searchme/replaceme/g
":%!perl -pi -e 's/<text>/\n/'

"use * on word for search (# for backwards search)
"when writing searches with /... use ctrl+r, ctrl+w to get the word under the cursor copied to the search terms
"% jumps to the other part of a () {} []...
"ctrl+x-ctrl+f for autocomplete filenames
"ctrl+x-ctrl+u for autocomplete whatever visible inside tmux panel
"
"if arrow keys stop working, use :!reset
"
"if you want to join without inserting spaces, do gJ

"/\v%4v.|%8v
"
"delete line match abe
":g/abe/d

let mapleader=","
set t_ti= t_te=

let g:ackprg = 'ag --vimgrep'
:set directory=$HOME/.vim/swap//

"call plug#begin('~/.vim/plugged')
"
"Plug 'altercation/vim-colors-solarized'
"Plug 'mileszs/ack.vim'
"Plug 'tpope/vim-surround'
"Plug 'jgdavey/tslime.vim'
"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'benmills/vimux'
""Plug 'edkolev/tmuxline.vim'
"Plug 'wellle/tmux-complete.vim'
"Plug 'tpope/vim-obsession'
"Plug 'tpope/vim-fugitive'
"Plug 'sk1418/Join'
"Plug 'nelstrom/vim-visual-star-search'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'rhysd/committia.vim' " commit screen stuff
""Plug 'vim-perl/vim-perl'
"Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp highlight-all-pragmas method-signatures moose test-more try-tiny' }
"Plug 'vim-perl/vim-perl6'
"Plug 'editorconfig/editorconfig-vim'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'ntpeters/vim-better-whitespace'
"Plug 'tmux-plugins/vim-tmux'
"Plug 'chrisbra/SudoEdit.vim'
"Plug 'junegunn/vim-slash'
"Plug 'junegunn/vim-easy-align'
"Plug 'lifepillar/pgsql.vim'
"Plug 'godlygeek/tabular' " for tabularizing on =, do :Tabularize /=
"Plug 'matze/vim-move'
"Plug 'tmux-plugins/vim-tmux-focus-events'
"Plug 'blueyed/vim-diminactive'
"Plug 'w0rp/ale'
"Plug 'elmcast/elm-vim'
"Plug 'mbbill/undotree'
"
"" disabled, might conflict with vim-slash, but if all is imported, vim gets kinda bugga
"" haven't found how to enable trackperlvars.vim support only
""Plug 'thoughtstream/Damian-Conway-s-Vim-Setup'
"
"call plug#end()
"
"let g:sudo_no_gui=1
"
"let g:ale_linters = {'perl': ['perl'], 'javascript': ['eslint', 'prettier'], 'python': ['flake8', 'pylint3', 'mypy']}
"let g:ale_python_mypy_options = '--ignore-missing-imports'
"let g:ale_fixers = {'python': ['autopep8', 'yapf', 'isort']}
"let g:ale_fix_on_save = 1
"let g:ale_sign_column_always = 1
"let g:ale_javascript_eslint_use_global = 1
"let g:ale_javascript_eslint_executable = 'eslint_d'
"" let ale be usable (not too goddam slow)
"let g:ale_echo_delay = 500
"
"let g:airline#extensions#ale#enabled = 1
"let g:airline_theme='solarized'
"
""plugin config:
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_tab_nr = 1
"let g:airline#extensions#tabline#tab_nr_type = 1
"let g:airline#extensions#tabline#tab_nr_type = 1
"let g:tmuxline_powerline_separators = 0
"let g:tmuxline_preset = 'tmux'
"let g:ackprg = 'ag --vimgrep'
"
""let g:EditorConfig_verbose = 1
"let g:EditorConfig_max_line_indicator = "exceeding"

nnoremap <Tab> :CtrlPBuffer<CR>

"matze/vim-move (alt isn't mapped in terminal, is send as <Esc>
let g:move_map_keys = 0
vmap <Esc>j <Plug>MoveBlockDown
vmap <Esc>k <Plug>MoveBlockUp
nmap <Esc>j <Plug>MoveLineDown
nmap <Esc>k <Plug>MoveLineUp


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

set autoread

let g:sql_type_default = 'pgsql'


""dein Scripts----------------------------- 
"set runtimepath^=~/.vim/repos/github.com/Shougo/dein.vim 
"call dein#begin(expand('~/.vim'))
"call dein#add('Shougo/dein.vim')
"
"" Add or remove your plugins here:
"call dein#add('altercation/vim-colors-solarized')
"call dein#add('mileszs/ack.vim')
"call dein#add('tpope/vim-surround')
"call dein#add('jgdavey/tslime.vim')
"call dein#add('bling/vim-airline')
"call dein#add('benmills/vimux')
"call dein#add('edkolev/tmuxline.vim')
"call dein#add('wellle/tmux-complete.vim')
"call dein#add('tpope/vim-obsession.git')
"call dein#add('tpope/vim-fugitive.git')
"call dein#add('sk1418/Join.git')
"call dein#add('nelstrom/vim-visual-star-search')
"call dein#add('christoomey/vim-tmux-navigator')
"call dein#add('rhysd/committia.vim') " commit screen stuff
"call dein#add('vim-perl/vim-perl')
"call dein#add('vim-perl/vim-perl6')
"call dein#add('editorconfig/editorconfig-vim')
"call dein#add('ctrlpvim/ctrlp.vim')
"call dein#add('ntpeters/vim-better-whitespace')
"call dein#add('tmux-plugins/vim-tmux')
""call dein#add('ciaranm/detectindent')
"
""call dein#add('Shougo/neosnippet.vim')
""call dein#add('Shougo/neosnippet-snippets')
""call dein#add('kien/ctrlp.vim')
"
"call dein#end() 
"
"If you want to install not installed plugins on startup.
"if has('vim_starting')
"    if dein#check_install()
"        call dein#install()
"    endif
"endif

"DetectIndent
":autocmd BufReadPost * :DetectIndent 
":let g:detectindent_preferred_expandtab = 1
":let g:detectindent_preferred_indent = 4


" Required:
filetype plugin indent on

"must be set early
"au BufNewFile,BufRead *.sql setf pgsql
let g:sql_type_default = 'pgsql'

syntax on

set nocompatible
set ruler
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set incsearch
set hlsearch
set formatoptions=q
set textwidth=78

filetype plugin on
autocmd BufRead,BufNewFile *.t set filetype=perl 
autocmd BufRead,BufNewFile *.xhtml set filetype=xml

autocmd FileType c,cpp,php,inc,perl,cs :set cindent noautoindent
"autocmd FileType php :let php_folding = 1
"au FileType php syn region myCComment start="/\*" end="\*/"  fold keepend transparent
autocmd FileType php :imap <C-g> GLOBALS['<ESC>/[ ;'\-]\[$=]<CR>i']
autocmd FileType php :set keywordprg="help"
autocmd BufNewFile,BufRead *.php syn region myCComment start="/\*" end="\*/"  fold keepend transparent
autocmd BufNewFile,BufRead *.csv :setlocal formatoptions=roqn

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

set scrolloff=4
set sidescroll=4
" Set vim to use 'short messages'.
set shortmess=a
set showcmd
set report=0
set confirm
set showmatch
set matchpairs=(:),{:},[:],<:>
"set smarttab
"set autoindent
"set smartindent
"set nomodeline
set wildmenu
set wildmode=longest:list
set ttyfast
set lazyredraw

"set backspace=2
set shiftround
set errorformat=%f:%l:%m,\"%f\"\\,\ line\ %l\:\ %m
set nobackup
set writebackup
"set cinoptions=>s,{0,}0,?0,^0,:0,=s,p0,t0,+s,(0,)20,*30
set nostartofline
set notitle
set splitright
set undofile
set undodir=~/.vim_undo

set noerrorbells
set laststatus=2
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo,jump

" lists the chars chosen in listchars
"set list
set listchars=tab:».,trail:·

map <F1> :buffer! 1<enter>
map <F2> :buffer! 2<enter>
map <F3> :buffer! 3<enter>
map <F4> :buffer! 4<enter>
map <F5> :buffer! 5<enter>
map <F6> :buffer! 6<enter>
map <F7> :buffer! 7<enter>
map <F8> :buffer! 8<enter>
map <F9> :buffer! 9<enter>
map <F10> :buffer! 10<enter>
map <F11> :buffer! 11<enter>
map <F12> :buffer! 12<enter>
nmap <C-N> :set invnumber <CR>
map <Up> gk
map <Down> gj
map <C-q> "AY
imap <Up> <C-o>gk
imap <Down> <C-o>gj

" map up,down to right keys in visual mode
vmap <Up> <Up>
vmap <Down> <Down>

"set formatoptions=tcroq
" autoformat commant (c comment) q (allows gq) and a automatically breaks lines
"set diffexpr="diff -u v:fname_in v:fname_new > v:fname_out"
"
"for removing DIFF_OPTIONS
if v:progname =~ "vimdiff" && exists("$DIFF_OPTIONS")
let $DIFF_OPTIONS = ""
endif

"" make tab do tabs at beginning and spaces elsewhere
"function! VaryTabs()
"  if &expandtab
"    return "\<Tab>"
"  else
"  let nonwhite = matchend(getline('.'),'[^ \t,]')
"	echo nonwhite
"    if nonwhite < 0 || col('.') <= nonwhite
"      return "\<Tab>"
"    else
"			let from_tab_stop = (virtcol('.') - 1) % &tabstop
"			return repeat(" ", &tabstop - from_tab_stop)
"    endif
"  endif
"endfunction

" spelling
set spellfile=~/.vim/standard.latin1.add 
set spelllang=en_gb
set equalalways

" python stuff, http://henry.precheur.org/2008/4/18/Indenting_Python_with_VIM.html
filetype plugin indent on
let python_highlight_all = 1

"autocmd FileType perl :abbreviate echo print
autocmd FileType perl :abbreviate doccom =pod begin nd<CR><CR>=cut
autocmd FileType perl :noremap K :!perldoc <cword> <bar><bar> perldoc -f <cword><cr>

autocmd BufNewFile,BufRead *.p6 setf perl6
"autocmd BufNewFile,BufRead *.html.ep setf html
au BufRead,BufNewFile *.html.epl set filetype=html.epl
au BufRead,BufNewFile *.html.ep  set filetype=html.epl
au FileType make setlocal noexpandtab

"autocmd FileType sql :map <C-k> #n"ayw/;<CR>:noh<CR>o<Esc>!!perl ~/src/d2fe/tools/get_type_id.pl <C-R>a<CR><Esc>

"autocmd FileType mail :set comments="[A-Z][a-zA-Z-]+:"
"autocmd FileType mail :set tw=80 formatoptions=atroqnw comments=f:From,f:To,f:Cc,f:Bcc,f:Subject,f:Reply-To expandtab
"autocmd FileType mail :set tw=80 formatoptions=atcroqw comments=f:From,f:To,f:Cc,f:Bcc,f:Subject,f:Reply-To,f:In-Reply-To,f:> expandtab spell spelllang=da
"autocmd FileType mail :map <C-s> !!cat ~/.mutt/signature<CR>

"autocmd FileType plaintex set tw=110 formatoptions=qnw spell
autocmd FileType plaintex,tex setlocal tw=80 formatoptions=atqnw spell
autocmd FileType plaintex,tex abbreviate relaxng RELAX NG
autocmd FileType plaintex,tex let &l:include .= '\|\\texinc{'
"autocmd BufWritePost plaintex,tex :!touch .do_build 
"autocmd FileType plaintex set tw=110 formatoptions=atqnw spell

" also break text when writing in tex
"autocmd FileType plaintex :set textwidth=110
"autocmd FileType plaintex :set formatoptions+=atw
au! BufRead,BufNewFile /tmp/psql.edit.* :call SetPGSQL()
"au! BufRead,BufNewFile *.sql :SQLSetType psql
autocmd BufWritePre *.pl silent! !chmod +x %
"autocmd FileType java,perl,sql,php autocmd BufWritePre <buffer> :%s/\s\+$//e

function! SetPGSQL()
	set ft=sql
	setf pgsql
	SQLSetType psql
endfunction

let $INSIDE_VIM = 1

"set whichwrap=b,s,<,>


"set showmode
"highlight Comment ctermfg=DarkGreen

"ab XHTMLSTART   <?xml version="1.0" encoding="ISO-8859-1"?><CR><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><CR><CR><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"><CR><head><CR><title></title><CR></head><CR><body><CR><CR></body><CR></html>
"ab HTMLSTART    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><CR><CR><html><CR><head><CR><title></title><CR></head><CR><body><CR><CR></body><CR></html>
"ab CSSLINK      <link href="" type="text/css" rel="StyleSheet">
" eof
ab kanallerne kanalerne
ab kanaller kanaler
ab kanalle kanale
ab P use DDP; p
ab C use Carp; Carp::cluck
"autocmd! bufwritepost .vimrc source ~/.vimrc

let g:perl_path_to = {}
function! GotoModule(module)
    let files  = []

    if !has_key(g:perl_path_to, a:module)
        let g:perl_path_to[a:module] = []
        let lib    = split(system("perl -le 'print join $/ => @INC'"), "\n")
        let module = substitute(a:module, '::', '/', 'g') . '.pm'

        for path in lib
            let path = path . '/' . module
            if filereadable(path)
                let g:perl_path_to[a:module] = g:perl_path_to[a:module] + [ path ]
            endif
        endfor
    endif

    let paths = g:perl_path_to[a:module]
    if empty(paths)
        echomsg("Module '".a:module."' not found")
    else
        let file = PickFromList('file', paths)
    endif
    execute "edit " . file
endfunction

function! PickFromList( name, list, ... )
    let forcelist = a:0 && a:1 ? 1 : 0

    if 1 == len(a:list) && !forcelist
        let choice = 0
    else
        let lines = [ 'Choose a '. a:name . ':' ]
            \ + map(range(1, len(a:list)), 'v:val .": ". a:list[v:val - 1]')
        let choice  = inputlist(lines)
        if choice > 0 && choice <= len(a:list)
            let choice = choice - 1
        else
            let choice = choice - 1
        endif
    end

    return a:list[choice]
endfunction

" only works for Perl
au! FileType perl :noremap <buffer> <leader>gm  :call GotoModule(expand('<cword>'))<cr>

" make sure we pick up the colon as part of our keyword
autocmd FileType perl setlocal iskeyword+=:
"autocmd FileType perl source ~/.vim/use_perl.vim

" don't kill 'undo' in other buffers
set hidden

set t_Co=256
"let g:solarized_termtrans = 1
"let g:solarized_contrast="high"
"colorscheme solarized

"background is set in .vimrc.local


"inoremap <Tab> <C-R>=VaryTabs()<CR>

"let perl_fold=0
"let perl_nofold_packages=1
"let perl_nofold_subs=1

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

function! HLNext (blinktime)
	highlight WhiteOnRed ctermfg=white ctermbg=red
	let [bufnum, lnum, col, off] = getpos('.')
	let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
	let target_pat = '\c\%#'.@/
	let ring = matchadd('WhiteOnRed', target_pat, 101)
	redraw
	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
	call matchdelete(ring)
	redraw
endfunction

" This rewires n and N to do the highlighing...
"nnoremap <silent> n   n:call HLNext(0.2)<cr>
"nnoremap <silent> N   N:call HLNext(0.2)<cr>

"http://blogs.perl.org/users/marcel_grunauer/2011/07/vim-script-to-fix-the-current-files-package-name.html
function! PerlPackageNameFromFile()
    let filename = expand('%:p')
    let package = substitute(filename, '^.*/lib/', '', '')
    let package = substitute(package, '\.pm$', '', '')
    let package = substitute(package, '/', '::', 'g')
    return package
endfunction

function! PerlReplacePackageName()
    let package = PerlPackageNameFromFile()
    let pos = getpos('.')
    1,/^package\s/s/^package\s\+\zs[A-Za-z_0-9:]\+\ze\(\s\+{\|;\)/\=package/
    call setpos('.', pos)
endfunction

autocmd FileType perl nnoremap <Leader>pa :<C-u>call PerlReplacePackageName()<CR>

"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)

filetype on
augroup PatchDiffHighlight
	autocmd!
	autocmd FileType  diff   syntax enable
augroup END

"====[ Make ; work like :, to make colon commands easier to type ]======
nnoremap  ;  :

set title titlestring=

vnoremap <leader>pb :!pbcopy<cr>u
noremap <leader>v o<cr>:set paste<cr>:.!pbpaste<cr>:set nopaste<cr>

"disable ex mode
:map Q <Nop>

"set shell=/bin/zsh
"set shellcmdflag=

"source ~/.vimrc.local

"should be temp
set t_BE=
