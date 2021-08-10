syntax on

set guicursor=
set clipboard=unnamed
set relativenumber
set nu
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
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
set shell=pwsh shellquote=( shellpipe=\| shellxquote=
set shellcmdflag=-NoLogo\ -ExecutionPolicy\ RemoteSigned\ -Command
set shellredir=\|\ Out-File\ -Encoding\ UTF8

call plug#begin('~/AppData/Local/nvim-data/site/plugged')
Plug 'ajmwagar/vim-deus'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua' 
Plug '907th/vim-auto-save'
Plug 'tpope/vim-fugitive' 
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
	    \ 'coc-powershell',
	    \ 'coc-eslint',
	    \ 'coc-html',
	    \ 'coc-prettier',
	    \ 'coc-pyright',
	    \ 'coc-phpls',
	    \ 'coc-sh',
	    \ 'coc-snippets',
	    \ 'coc-sql',
	    \ 'coc-translator',
	    \ 'coc-tsserver',
	    \ 'coc-xml']
"            \ 'coc-spell-checker',
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>f  <Plug>(coc-format-selected)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Run formatter on save
augroup SWIMKILLS
    autocmd!
    autocmd BufWrite * silent! Format
augroup END

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
inoremap KJ <ESC>
" Disable ctrl+z
nnoremap <C-z> <Nop>
