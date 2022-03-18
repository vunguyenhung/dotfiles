mv Brewfile Brewfile-bak
brew bundle dump && rm -rf Brewfile-bak

cp -r ~/.config/karabiner ./
cp $NVM_DIR/default-packages ./
