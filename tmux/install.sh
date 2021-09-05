echo "Installing tmux..."
brew install tmux
echo "Installed tmux!"

echo "Copying configs..."
cp ./tmux.conf ~/.tmux.conf
cp ./tmux.paper-color-theme ~/.tmux.paper-color-theme
echo "Copied configs!"

echo "Installing Plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
echo "Installed Plugins"
