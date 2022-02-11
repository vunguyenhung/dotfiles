let g:fzf_layout = { 'down': '40%' }

let $BAT_THEME='Dracula'
" Improved Ripgrep
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
let $FZF_DEFAULT_OPTS = '--bind ctrl-s:select-all'

" Search files
nnoremap ` :Files<CR>

" Search code
nnoremap <leader>` :RG<CR>

" Search code, auto input the first register
nnoremap <leader>`` :RG <C-r>"<CR>

" Search commits
nnoremap <leader>gc :Commits<CR>

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
