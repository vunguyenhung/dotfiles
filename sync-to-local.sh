echo "Syncing neovim configs..."
bash ./neovim/sync-to-local.sh
echo "Synced neovim configs!"

echo "Syncing zsh configs..."
bash ./zsh/sync-to-local.sh
echo "Synced zsh configs!"

echo "Syncing tmux configs..."
bash ./tmux/sync-to-local.sh
echo "Synced tmux configs!"
