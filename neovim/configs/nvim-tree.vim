let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', 'DS_Store' ]
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_gitignore = 1 "0 by default

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-f> :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly
