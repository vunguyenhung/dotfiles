echo "Installing Alacritty..."
brew install --cask alacritty

echo "Installing Fira Code Nerd font..."
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font

echo "Copying configs..."
cp ./alacritty.yml ~/.alacritty.yml
