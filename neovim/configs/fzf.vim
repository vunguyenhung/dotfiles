" Search files
nnoremap ` :Files<CR>
" Search code
nnoremap <leader>` :Rg<CR>
" Search commits
nnoremap <leader>c :Commits<CR>

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --decorate --all --reflog --format="%C(auto)%h%d %s | %C(auto)%C(bold)%cr"'
