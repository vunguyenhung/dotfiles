echo "Installing tmux..."
brew install tmux
echo "Installed tmux!"


echo "Copying configs..."
cp ./tmux.conf ~/.tmux.conf
cp ./tmux.paper-color-theme ~/.tmux.paper-color-theme
echo "Copied configs!"
