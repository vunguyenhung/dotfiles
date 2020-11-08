echo "Installing neovim..."
brew install neovim

echo "Installing vim-plug..."
bash ./vim-plug.sh

echo "Copying configs..."
mkdir ~/.config/nvim && cp -r ./configs/* ~/.config/nvim/

echo "Installing Vim Plugins..."
vi -c ':PlugInstall | :qa'
