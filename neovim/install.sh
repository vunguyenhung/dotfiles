echo "Installing neovim..."
brew install neovim
echo "Installed neovim!"

echo "Installing vim-plug..."
bash ./vim-plug.sh
echo "Installed vim-plug!"

echo "Copying configs..."
mkdir ~/.config/nvim && cp -r ./configs/* ~/.config/nvim/
echo "Copied configs!"

echo "All automated steps are DONE"
echo "Please refer to README.md for proceeding to manual steps"
