""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      ██▓ ███▄    █  ██▓▄▄▄█████▓      ██▒   █▓ ██▓ ███▄ ▄███▓
"     ▓██▒ ██ ▀█   █ ▓██▒▓  ██▒ ▓▒     ▓██░   █▒▓██▒▓██▒▀█▀ ██▒
"     ▒██▒▓██  ▀█ ██▒▒██▒▒ ▓██░ ▒░      ▓██  █▒░▒██▒▓██    ▓██░
"     ░██░▓██▒  ▐▌██▒░██░░ ▓██▓ ░        ▒██ █░░░██░▒██    ▒██ 
"     ░██░▒██░   ▓██░░██░  ▒██▒ ░  ██▓    ▒▀█░  ░██░▒██▒   ░██▒
"     ░▓  ░ ▒░   ▒ ▒ ░▓    ▒ ░░    ▒▓▒    ░ ▐░  ░▓  ░ ▒░   ░  ░
"      ▒ ░░ ░░   ░ ▒░ ▒ ░    ░     ░▒     ░ ░░   ▒ ░░  ░      ░
"      ▒ ░   ░   ░ ░  ▒ ░  ░       ░        ░░   ▒ ░░      ░   
"      ░           ░  ░             ░        ░   ░         ░   
"                                   ░       ░                  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on

set guicursor=
set clipboard=unnamed
set relativenumber
set nu
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set encoding=utf-8
set signcolumn=yes
set colorcolumn=80
set updatetime=100
set completefunc=emoji#complete
"set shell=pwsh shellquote=( shellpipe=\| shellxquote=
"set shellcmdflag=-NoLogo\ -ExecutionPolicy\ RemoteSigned\ -Command
"set shellredir=\|\ Out-File\ -Encoding\ UTF8

call plug#begin('~/AppData/Local/nvim-data/site/plugged')
Plug 'ajmwagar/vim-deus'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mfussenegger/nvim-dap'
"Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua' 
"Plug '907th/vim-auto-save'
"Plug 'tpope/vim-fugitive' 
Plug 'preservim/nerdtree' 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
"Plug 'frazrepo/vim-rainbow'
Plug 'preservim/nerdcommenter'
Plug 'justinmk/vim-sneak'
Plug 'ervandew/supertab'
Plug 'kachyz/vim-gitmoji'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
call plug#end()
lua require'colorizer'.setup()

" Colorscheme
colorscheme deus
let g:deus_termcolors=256
hi Normal ctermbg=NONE guibg=NONE
hi ColorColumn ctermbg=80 guibg=red
"hi airline_tabfill guibg=NONE
"hi clear CursorLineNr
"hi clear SignColumn
hi clear ColorColumn

" Coc extensions
let g:coc_global_extensions = [
	    \ 'coc-clangd',
	    \ 'coc-css',
	    \ 'coc-emmet',
	    \ 'coc-git',
	    \ 'coc-go',
	    \ 'coc-java',
	    \ 'coc-json', 
	    \ 'coc-pairs',
	    \ 'coc-eslint',
	    \ 'coc-html',
	    \ 'coc-prettier',
	    \ 'coc-phpls',
	    \ 'coc-sh',
	    \ 'coc-snippets',
	    \ 'coc-sql',
	    \ 'coc-pyright',
	    \ 'coc-translator',
	    \ 'coc-tsserver',
	    \ 'coc-xml']
"	    \ 'coc-powershell',
"            \ 'coc-spell-checker',

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nnoremap <leader>f  <Plug>(coc-format-selected)
" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')
" " Run formatter on save
" augroup SWIMKILLS
"     autocmd!
"     autocmd BufWrite * silent! Format
" augroup END

" Airline config
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

" Emmet Shortcuts
let g:user_emmet_mode='n' "Only enable normal mode functions
let g:user_emmet_leader_key=','

" NERDTree shortcut
map <Leader>\ :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinPos = 'left'

" UndoTree shortcut
let g:undotree_WindowLayout=3
nnoremap <Leader>A :UndotreeToggle<CR>

" Sneak
let g:sneak#s_next = 1

" Vim Rainbow Brackets
"let g:rainbow_active = 1

" Gitgutter
let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
hi GitGutterAdd guifg=#009900 ctermfg=Green
hi GitGutterChange guifg=#bbbb00 ctermfg=Yellow
hi GitGutterDelete guifg=#ff2222 ctermfg=Red
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_sign_allow_clobber = 1

" Replace text with emoji
function! Submoji()
    %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g
endfunction
nnoremap <A-\> :call Submoji()<CR>

" Autosave
let g:auto_save = 1

" Key remaps
" Shift lines up & down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" Open terminal
nnoremap <Leader>] :te<CR>
" No highlight
nnoremap // :noh<CR>
" Resize split
nnoremap <Leader>w :resize+10<CR>
nnoremap <Leader>s :resize-10<CR>
nnoremap <Leader>d :vertical resize+10<CR>
nnoremap <Leader>a :vertical resize-10<CR>
" Remap esc
inoremap jk <ESC>
inoremap kj <ESC>
inoremap JK <ESC>
"inoremap KJ <ESC>
" Disable ctrl+z
nnoremap <C-z> <Nop>
" Switch Buffers
nnoremap <C-l> :bn<CR> 
nnoremap <C-h> :bp<CR> 

" Disable Uppercase J & K in normal mode
nnoremap <S-J> <Nop>
nnoremap <S-k> <Nop>

" FUNCTIONS
" Compile and execute C
func C()
    exec "!cls && gcc % && a.exe"
endfunc
map <silent> <C-b> :call C()<CR>

" Compile and execute CPP
func CPP()
    exec "!cls && g++ % && a.exe"
endfunc
map <silent> <C-b> :call CPP()<CR>

" Compile & execute Rust
func RUST()
    exec "!cls && rustc % && %:r.exe"
endfunc
map <silent> <C-b> :call RUST()<CR>

" Interpret Python
func PYTHON()
    exec "!cls && python %"
endfunc
map <silent> <C-b> :call PYTHON()<CR>

" Compile Java
func JAVA()
    exec "!cls && javac % && java %"
endfunc
map <silent> <C-b> :call JAVA()<CR>

" Compile Kotlin
func KOTLIN()
    exec "!cls && kotlinc % -include-runtime -d %:r.jar && java -jar %:r.jar"
endfunc
map <silent> <C-b> :call KOTLIN()<CR>

" Interpret JavaScript
func JAVASCRIPT()
    exec "!cls && node %"
endfunc
map <silent> <C-b> :call JAVASCRIPT()<CR>

" Interpret TypeScript
func TYPESCRIPT()
    exec "!cls && tsc % && node %:r.js"
endfunc
map <silent> <C-b> :call TYPESCRIPT()<CR>

" Interpret PHP
func PHP()
    exec "!cls && php %"
endfunc
map <silent> <C-b> :call PHP()<CR>

" Run Ruby
func RUBY()
	exec "!cls && ruby %"
endfunc
map <silent> <C-b> :call RUBY()<CR>

" Build Go
func GOLANG()
	exec "!cls && go build % && %:r.exe"
endfunc
map <silent> <C-b> :call GOLANG()<CR>

" Compile Haskell
func HASKELL()
	exec "!cls && ghc % && % && %:r.exe"
endfunc
map <silent> <C-b> :call HASKELL()<CR>

" Run Perl
func PERL()
	exec "!cls && perl %"
endfunc
map <silent> <C-b> :call PERL()<CR>

" Run Bash
func BASH()
	exec "!cls && bash %"
endfunc
map <silent> <C-b> :call BASH()<CR>

" Run Powershell
func POWERSHELL()
	exec "!cls && %"
endfunc
map <silent> <C-b> :call POWERSHELL()<CR>


autocmd Filetype c map <C-b> :call C()<CR>
autocmd Filetype cpp map <C-b> :call CPP()<CR>
autocmd Filetype rust map <C-b> :call RUST()<CR>
autocmd Filetype python map <C-b> :call PYTHON()<CR>
autocmd Filetype java map <C-b> :call JAVA()<CR>
autocmd Filetype kotlin map <C-b> :call KOTLIN()<CR>
autocmd Filetype javascript map <C-b> :call JAVASCRIPT()<CR>
autocmd Filetype typescript map <C-b> :call TYPESCRIPT()<CR>
autocmd Filetype php map <C-b> :call PHP()<CR>
autocmd Filetype ruby map <C-b> :call RUBY()<CR>
autocmd Filetype go map <C-b> :call GOLANG()<CR>
autocmd Filetype haskell map <C-b> :call HASKELL()<CR>
autocmd Filetype bash map <C-b> :call BASH()<CR>
autocmd Filetype perl map <C-b> :call PERL()<CR>
autocmd Filetype powershell map <C-b> :call POWERSHELL()<CR>

