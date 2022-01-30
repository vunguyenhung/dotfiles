echo "Installing zsh..."
brew install zsh

echo "Installing ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing zplug..."
brew install zplug

echo "Installing plugins..."
# ripgrep
brew install ripgrep

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-nvm
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

echo "Backing up your configs..."
mkdir -p ~/.backup/dotfiles/zsh
cp ~/.zshrc ~/.backup/dotfiles/zsh/.zshrc
cp ~/.ripgreprc ~/.backup/dotfiles/zsh/.ripgreprc

echo "Copying configs..."
cp ./zshrc ~/.zshrc
cp ./ripgreprc ~/.ripgreprc

echo "Applying new zsh configs..."
source ~/.zshrc
