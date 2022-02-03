mv Brewfile Brewfile-bak
brew bundle dump
if [ -f "Brewfile" ]; then
    rm -f Brewfile-bak
else 
    echo "System Packages sync failed"
    mv Brewfile-bak Brewfile
fi
