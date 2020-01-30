" Rg with preview window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --decorate --all --reflog --format="%C(auto)%h%d %s | %C(auto)%C(bold)%cr"'

" Search files
nnoremap ` :Files<CR>
" Search code
nnoremap <leader>` :Rg<CR>
" Search commits
nnoremap <leader>c :Commits<CR>
