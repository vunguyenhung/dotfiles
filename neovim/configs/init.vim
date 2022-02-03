" Map leader to <space> key
let mapleader = "\<Space>"

" vim-plug package manager
call plug#begin('~/.local/share/nvim/plugged')

" emmet
Plug 'mattn/emmet-vim'

" Navigation
Plug 'beauwilliams/focus.nvim'
Plug 'https://github.com/numToStr/Navigator.nvim'
Plug 'sunaku/tmux-navigate'

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

" hop.nvim - Easy navigation in VIM
Plug 'phaazon/hop.nvim'

" vim-incsearch - VIM incsearch improved
Plug 'haya14busa/incsearch.vim'

" vim-polyglot - syntax highlight
Plug 'sheerun/vim-polyglot'

" Typescript syntax highlight
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" vim-markdown - syntax for markdown
Plug 'https://github.com/plasticboy/vim-markdown'

" nvim tmux integration
Plug 'https://github.com/aserowy/tmux.nvim'
" Plug 'https://github.com/christoomey/vim-tmux-navigator'

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

" File explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" fzf - fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" indentLine - display thin vertical lines
Plug 'https://github.com/Yggdroot/indentLine'

" editorconfig
Plug 'https://github.com/editorconfig/editorconfig-vim'

" surround parentheses, brackets, quotes, XML tags, and more.
Plug 'https://github.com/tpope/vim-surround'

" repeat, use `.` command to repeat plugin command
Plug 'https://github.com/tpope/vim-repeat'

" improved %
Plug 'andymass/vim-matchup'

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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'kosayoda/nvim-lightbulb'

Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-lua/plenary.nvim'

" theme
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" pretty list of diagnostics
Plug 'folke/trouble.nvim'

" highlight todo comments
Plug 'folke/todo-comments.nvim'

" View and search LSP symbol
Plug 'stevearc/aerial.nvim'

" show git diff in the gutter
Plug 'lewis6991/gitsigns.nvim'

" Enable dev icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" vim-startify - start screen for vim
Plug 'mhinz/vim-startify'

" Improved register
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }

" Github in neovim
Plug 'https://github.com/pwntester/octo.nvim'

call plug#end()

" Theme
source $VIMCONFIG_DIR/dracula.vim
" source $VIMCONFIG_DIR/dracula.vim

" Init in lua
lua require("init")

"" LSP Settings
lua require("lsp-config")
source $VIMCONFIG_DIR/lsp.vim

" focus.nvim settings
source $VIMCONFIG_DIR/focus.vim

" vsnip settings
source $VIMCONFIG_DIR/vsnip.vim

" vim-startify settings
source $VIMCONFIG_DIR/vim_startify.vim

" incsearch plugin settings
source $VIMCONFIG_DIR/incsearch.vim

" indentLine plugin settings
source $VIMCONFIG_DIR/indentLine.vim

" nvim-tree plugin settings
source $VIMCONFIG_DIR/nerdtree.vim

" fzf.vim settings
source $VIMCONFIG_DIR/fzf.vim

" hop.nvim settings
source $VIMCONFIG_DIR/hop.vim

" vim-abolish settings
source $VIMCONFIG_DIR/vim_abolish.vim

" vim-markdown settings
source $VIMCONFIG_DIR/vim_markdown.vim

" vim-fugitive settings
source $VIMCONFIG_DIR/vim_fugitive.vim

" vim-matchup settings
source $VIMCONFIG_DIR/vim-matchup.vim

" tree-sitter settings
source $VIMCONFIG_DIR/treesitter.vim

" source $VIMCONFIG_DIR/colors.vim

" Tab shortcuts
nnoremap <C-t>n :tabnew %<CR>
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
set cursorline
set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set signcolumn=yes
" display incomplete commands
set showcmd

" refesh on external changes
" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
" set autowrite     " Automatically :write before running commands
" set autowriteall     " Automatically :write before running commands
set number
" set hidden

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
