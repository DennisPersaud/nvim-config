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
"
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

