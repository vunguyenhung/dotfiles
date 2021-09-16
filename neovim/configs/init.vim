" Map leader to <space> key
let mapleader = "\<Space>"

" vim-plug package manager
call plug#begin('~/.local/share/nvim/plugged')

" rust.vim: Rust support for vim
Plug 'https://github.com/rust-lang/rust.vim'

" vim-indent-object: defines a new text object representing lines of code at the same indent level
Plug 'https://github.com/michaeljsmith/vim-indent-object'

" vim-colorizer: color hex codes and color names
Plug 'https://github.com/chrisbra/Colorizer'

" auto-pairs - Insert or delete brackets, parens, quotes in pair
Plug 'https://github.com/jiangmiao/auto-pairs'

" Haskell support for vim
Plug 'https://github.com/neovimhaskell/haskell-vim'

" vim-easymotion - Easy navigation in VIM
Plug 'https://github.com/easymotion/vim-easymotion'

" vim-incsearch - VIM incsearch improved
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" vim-polyglot - syntax highlight
Plug 'sheerun/vim-polyglot'

" Typescript syntax highlight
Plug 'leafgarland/typescript-vim'

" vim-markdown - syntax for markdown
Plug 'https://github.com/plasticboy/vim-markdown'

" vim-tmux-navigator - Navigate between vim & tmux seemlessly
Plug 'https://github.com/christoomey/vim-tmux-navigator'

" vim-tmux-resizer - Resize vim & tmux panes seemlessly
Plug 'https://github.com/melonmanchan/vim-tmux-resizer'

" vim-commentary - comment stuff out
Plug 'https://github.com/tpope/vim-commentary'

" vim-abolish - better replace
Plug 'https://github.com/tpope/vim-abolish'

" unimpaired - set of vim util aliases
Plug 'https://github.com/tpope/vim-unimpaired'

" vim-fugitive - git wrapper for vim
Plug 'https://github.com/tpope/vim-fugitive.git'

" rhubarb.vim: GitHub extension for fugitive.vim
Plug 'https://github.com/tpope/vim-rhubarb'

" nerdtree - file system explore
Plug 'scrooloose/nerdtree'

" Vim sugar for the UNIX shell commands
Plug 'https://github.com/tpope/vim-eunuch'

" fzf - fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" projectionist - finding files semantically
Plug 'https://github.com/tpope/vim-projectionist'

" indentLine - display thin vertical lines
Plug 'https://github.com/Yggdroot/indentLine'

" editorconfig
Plug 'https://github.com/editorconfig/editorconfig-vim'

" surround parentheses, brackets, quotes, XML tags, and more.
Plug 'https://github.com/tpope/vim-surround'

" repeat, use `.` command to repeat plugin command
Plug 'https://github.com/tpope/vim-repeat'

"" Nvim LSP & code completion
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'glepnir/lspsaga.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-lua/plenary.nvim'
Plug 'onsails/lspkind-nvim'

" show git diff in the gutter
Plug 'lewis6991/gitsigns.nvim'

" Enable dev icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" vim-startify - start screen for vim
Plug 'mhinz/vim-startify'

" Improved register
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }

call plug#end()

" Theme
source $VIMCONFIG_DIR/theme.vim

" Init in lua
lua require("init")

"" LSP Settings
lua require("lsp-config")
source $VIMCONFIG_DIR/lsp.vim

" vsnip settings
source $VIMCONFIG_DIR/vsnip.vim

" vim-surround settings
source $VIMCONFIG_DIR/vim_surround.vim

" vim-startify settings
source $VIMCONFIG_DIR/vim_startify.vim

" incsearch plugin settings
source $VIMCONFIG_DIR/incsearch.vim

" indentLine plugin settings
source $VIMCONFIG_DIR/indentLine.vim

" nerdtree plugin settings
source $VIMCONFIG_DIR/nerdtree.vim

" fzf.vim settings
source $VIMCONFIG_DIR/fzf.vim

" vim-easymotion settings
source $VIMCONFIG_DIR/vim_easymotion.vim

" vim-abolish settings
source $VIMCONFIG_DIR/vim_abolish.vim

" vim-markdown settings
source $VIMCONFIG_DIR/vim_markdown.vim

" vim-fugitive settings
source $VIMCONFIG_DIR/vim_fugitive.vim

" Tab shortcuts
nnoremap <C-t>n :tabnew<Cr>
nnoremap <C-t>l :tabnext<CR>
nnoremap <C-t>h :tabprev<CR>
nnoremap <C-t>c :tabclose<CR>

" Terminal Emulator settings
tnoremap <Esc> <C-c>

" Open config files
command! Viconfig :e $VIMCONFIG
command! Zshconfig :e ~/.zshrc

" Reload vim config file
command! Vireload :source $VIMCONFIG

" Editor setup
" Backspace deletes like most programs in insert mode
set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
" display incomplete commands
set showcmd
" refesh on external changes
set autoread | au CursorHold * checktime
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set number

" Use space, soft tab
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Copy to clipboard
vnoremap  Y  "+y
nnoremap  Y  "+y
nnoremap  YY  "+yy

" Paste from clipboard
nnoremap P "+p
vnoremap P "+p

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
