# Path to your oh-my-zsh installation.
export ZSH="/Users/shopback/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"

fpath=(/usr/local/share/zsh-completions $fpath)

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-nvm)

source $ZSH/oh-my-zsh.sh

# User configuration

# PROMPT
# setopt PROMPT_SUBST
# PROMPT='
# %f%F{yellow}[%D{%L:%M:%S}]%f %F{blue}${${(%):-%~}}%f $ %b'
# TMOUT=1

# TRAPALRM() {
    # zle reset-prompt
# }

# export MANPATH="/usr/local/man:$MANPATH"

# MySQL
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# NVIM
export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim
export VISUAL=nvim

# FZF
export FZF_DEFAULT_COMMAND="rg --files"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vim="nvim"
alias vi="nvim"
alias viconfig="vim $VIMCONFIG/init.vim"

# TMUX
export PATH_TMUX_CONFIG=~/.tmux.conf
# export TERM=xterm
[ -z "$TMUX" ] && export TERM=xterm-256color
alias tmuxconfig="vi $PATH_TMUX_CONFIG"
alias mux="tmuxinator"
alias tmuxns="tmux new -s leo"

# ZSH
alias zshconfig="vi ~/.zshrc"
alias zshreload="source ~/.zshrc"

# Bind hotkeys
bindkey "\e\eOD" backward-word
bindkey "\e\eOC" forward-word

# Swift
export TOOLCHAINS=swift
alias swift='PATH="/usr/bin:$PATH" swift'

# ShopBack bash
export PATH="$HOME/.shopbash/bin:$PATH"
eval "$(shopbash init -)"

# ShopBack SK
# source ~/.skrc

# Ruby
eval "$(rbenv init -)"

# Haskell
export PATH=$HOME/.local/bin:$PATH
source /Users/shopback/.ghcup/env

# K8s
alias kctl="kubectl"

# Utils
alias cl="clear"
alias cdcode="cd ~/Code"
alias cdsbcode="cd ~/Code/SHOPBACK"
mcd () { mkdir -p "$1" && cd "$1"; }

## Iron Gate
alias iron-gate-store-service-local-start="NODE_ENV=local NODE_PORT=9000 npm start"
alias iron-gate-store-service-local-test="NODE_ENV=test npm run test:unit -- --watch"
alias iron-gate-db-local-migrate-undo="NODE_ENV=local npm run db:sequelize db:migrate:undo:all"
alias iron-gate-db-local-migrate="NODE_ENV=local npm run db:sequelize db:migrate"
alias iron-gate-db-local-seed="NODE_ENV=local npm run db:sequelize db:seed:all"
alias iron-gate-db-local-sample-merchants="echo 0003885, 0003322, 0003326"
alias iron-gate-store-service-worker-local-start="NODE_ENV=local NODE_PORT=9001 npm start"
alias iron-gate-needle-local-start="NODE_ENV=development NEEDLE_SERVER_URL=http://localhost:9001 npm start"
alias iron-gate-needle-local-test="NODE_ENV=test npm run test:watch"

## Utils env var
export STUDY_HASKELL="/Users/shopback/Code/STUDY/haskell" 
