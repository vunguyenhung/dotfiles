echo "Installing zsh..."
brew install zsh
echo "Installed zsh!"

echo "Installing ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Installed ohmyzsh!"

echo "Installing ripgrep..."
brew install ripgrep
echo "Installed ripgrep!"

echo "Backing up your configs..."
mkdir -p ~/.backup/dotfiles/zsh
cp ~/.zshrc ~/.backup/dotfiles/zsh/.zshrc
cp ~/.ripgreprc ~/.backup/dotfiles/zsh/.ripgreprc
echo "You can find your backup files in ~/.backup/dotfiles/zsh"

echo "Copying configs..."
cp ./zshrc ~/.zshrc
cp ./ripgreprc ~/.ripgreprc
echo "Copied configs!"

echo "Applying new zsh configs..."
source ~/.zshrc
echo "Applied new zsh configs..."
