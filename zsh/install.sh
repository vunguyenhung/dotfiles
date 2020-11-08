echo "Installing zsh..."
brew install zsh

echo "Installing ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing ripgrep..."
brew install ripgrep

echo "Backing up your configs..."
mkdir -p ~/.backup/dotfiles/zsh
cp ~/.zshrc ~/.backup/dotfiles/zsh/.zshrc
cp ~/.ripgreprc ~/.backup/dotfiles/zsh/.ripgreprc

echo "Copying configs..."
cp ./zshrc ~/.zshrc
cp ./ripgreprc ~/.ripgreprc

echo "Applying new zsh configs..."
source ~/.zshrc
