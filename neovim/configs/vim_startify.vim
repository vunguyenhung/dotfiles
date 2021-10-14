let g:startify_change_to_vcs_root = 1
let g:startify_change_to_dir = 0

" Startify then NERDTree, on startup
autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                \ |   wincmd w
                \ | endif
