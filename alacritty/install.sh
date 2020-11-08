echo "Installing Alacritty..."
brew cask install alacritty
echo "Installed tmux!"

echo "Installing Fira Code Nerd font..."
brew tap homebrew/cask-fonts
brew cask install font-fira-code-nerd-font
echo "Installed Fira Code Nerd font!"

echo "Copying configs..."
cp ./alacritty.yml ~/.alacritty.yml
echo "Copied configs!"
