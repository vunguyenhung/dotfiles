" vim-plug package manager
call plug#begin('~/.local/share/nvim/plugged')

" unimpaired - set of vim util aliases
Plug 'https://github.com/tpope/vim-unimpaired'

" Git wrapper for vim
Plug 'https://github.com/tpope/vim-fugitive.git'

" nerdtree - file system explore
Plug 'scrooloose/nerdtree'

" fzf - fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" projectionist - finding files semantically
Plug 'https://github.com/tpope/vim-projectionist'

" indentLine - display thin vertical lines at each indentation level for code indented with spaces
Plug 'https://github.com/Yggdroot/indentLine'

" obsession - auto record session with :Obsession
Plug 'git://github.com/tpope/vim-obsession.git'

" editorconfig
Plug 'https://github.com/editorconfig/editorconfig-vim'

" surround parentheses, brackets, quotes, XML tags, and more. 
Plug 'https://github.com/tpope/vim-surround'

" repeat, use `.` command to repeat plugin command 
Plug 'https://github.com/tpope/vim-repeat'

call plug#end()

" indentLine settings
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Fzf
nnoremap <C-p> :<C-u>FZF<CR>

" Tab shortcuts
nnoremap <C-t>n :tabnew<Cr>
nnoremap <C-t>l :tabnext<CR>
nnoremap <C-t>h :tabprev<CR>
nnoremap <C-t>c :tabclose<CR>

" Terminal Emulator improvment
if has('nvim')
  tnoremap <Esc> <C-\><C-n> tnoremap <C-v><Esc> <Esc>
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

" Open config files
command! Viconfig :e $VIMCONFIG/init.vim
command! Zshconfig :e ~/.zshrc

" Terminal
command! Term split | terminal
command! VTerm vsplit | terminal

" Editor setup
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50

" Column
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Use space, soft tab
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Set line number
set number

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
