" Replace text with emoji
function! Submoji()
    %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g
endfunction
nnoremap <A-\> :call Submoji()<CR>
