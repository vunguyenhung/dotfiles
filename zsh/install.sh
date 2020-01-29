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
BACKUP_DIR="~/backup/dotfiles/zsh"
mkdir -p $BACKUP_DIR
cp ~/.zshrc $BACKUP_DIR/zshrc
cp ~/.ripgreprc $BACKUP_DIR/ripgreprc
echo "You can find your backup files in $BACKUP_DIR"

echo "Copying configs..."
cp ./zshrc ~/.zshrc
cp ./ripgreprc ~/.ripgreprc
echo "Copied configs!"

echo "Applying new zsh configs..."
source ~/.zshrc
echo "Applied new zsh configs..."
