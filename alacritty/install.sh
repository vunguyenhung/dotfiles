echo "Installing Alacritty..."
brew install --cask alacritty

echo "Installing Fira Code Nerd font..."
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font

echo "Copying configs..."
mkdir ~/.config/alacritty/
cp ./alacritty.yml ~/.config/alacritty/alacritty.yml
cp ./dracula.yml ~/.config/alacritty/dracula.yml
