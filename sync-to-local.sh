echo "Syncing neovim configs..."
cd neovim
bash ./sync-to-local.sh
cd ..
echo "Synced neovim configs!"

echo "Syncing zsh configs..."
cd zsh
bash ./sync-to-local.sh
cd ..
echo "Synced zsh configs!"

echo "Syncing tmux configs..."
cd tmux
bash ./sync-to-local.sh
cd ..
echo "Synced tmux configs!"
