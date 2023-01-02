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

" Autosave
let g:auto_save = 1
