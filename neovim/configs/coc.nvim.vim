let g:coc_config_home = $VIMCONFIG_DIR

let g:coc_global_extensions = [
            \ "coc-json",
            \ "coc-snippets",
            \ "coc-rls",
            \ "coc-tsserver",
            \]

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use <tab> for both expand and jump (make expand higher priority.)
imap <tab> <Plug>(coc-snippets-expand-jump)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
