let g:ale_linters = {
\   'haskell': ['hlint', 'hdevtools'],
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'eslint'],
\   'rust': ['rls']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'haskell': ['hlint', 'stylish-haskell', 'hindent'],
\   'javascript': ['prettier-eslint'],
\   'typescript': ['prettier'],
\   'rust': ['rustfmt']
\}

" TODO: run the following
" - stack install stylish-haskell
" - stack install hindent
" - stack install hlint
" - stack install apply-refact

let g:ale_haskell_hdevtools_options = '-g -Wall'
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_linters_explicit = 1

" Map keys
nmap <silent> ]g :ALENext<cr>
nmap <silent> [g :ALEPrevious<cr>
nmap <silent> ]d :ALEDetail<cr>
