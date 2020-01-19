echo "Installing zsh..."
brew install zsh
echo "Installed zsh!"

echo "Installing ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Installed ohmyzsh!"

echo "Installing ripgrep..."
brew install ripgrep
echo "Installed ripgrep!"

echo "Copying configs..."
cp ./zshrc ~/.zshrc
echo "Copied configs!"

echo "Applying new zsh configs..."
source ~/.zshrc
echo "Applied new zsh configs..."
