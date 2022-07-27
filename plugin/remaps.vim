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
