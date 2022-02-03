mv Brewfile Brewfile-bak
brew bundle dump
if [ -f "Brewfile" ]; then
    rm -f Brewfile-bak
else 
    echo "Sync System Packages failed!"
    mv Brewfile-bak Brewfile
fi
