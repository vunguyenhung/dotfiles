echo "Syncing alacritty configs..."
cd alacritty
bash ./sync-from-local.sh
cd ..

echo "Syncing neovim configs..."
cd neovim
bash ./sync-from-local.sh
cd ..

echo "Syncing zsh configs..."
cd zsh
bash ./sync-from-local.sh
cd ..

echo "Syncing tmux configs..."
cd tmux
bash ./sync-from-local.sh
cd ..
