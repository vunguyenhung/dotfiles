" Rg with preview window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Improved Rg
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --decorate --all --reflog --format="%C(auto)%h%d %s | %C(auto)%C(bold)%cr"'

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" Search files
nnoremap ` :Files<CR>

" Search code
nnoremap <leader>` :RG<CR>

" Search code, auto input the first register
nnoremap <leader>`r :RG <C-r>"<CR>

" Search commits
nnoremap <leader>gc :Commits<CR>
