" For more info about flags, refer to: https://www.thegeekstuff.com/2009/04/vi-vim-editor-search-and-replace-examples/

" For more info about vim-abolish, refer to: https://github.com/tpope/vim-abolish/blob/master/doc/abolish.txt

" Substitute only the current line
nnoremap <Leader>s :Subvert/

" Substitute inside the current bracket
nnoremap <Leader>s{ :?{?,/}/Subvert/

" Substitute until the end of the file, starts from the cursor
nnoremap <Leader>sG :$,Subvert/

" Substitute the entire file
nnoremap <Leader>S :%Subvert/

" Substitute the entire file, auto input the first register
nnoremap <Leader>Sr :%Subvert/<C-r>"/
