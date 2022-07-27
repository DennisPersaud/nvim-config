" Replace text with emoji
function! Submoji()
    %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g
endfunction
nnoremap <A-\> :call Submoji()<CR>

" Strip Trailing Whitespace 
function StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
nnoremap <Leader>x :<C-U>call StripTrailingWhitespace()<CR>
