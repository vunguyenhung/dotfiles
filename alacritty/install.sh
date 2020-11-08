echo "Installing Alacritty..."
brew cask install alacritty

echo "Installing Fira Code Nerd font..."
brew tap homebrew/cask-fonts
brew cask install font-fira-code-nerd-font

echo "Copying configs..."
cp ./alacritty.yml ~/.alacritty.yml
