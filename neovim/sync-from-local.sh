mv ./configs ./configs-bak
mkdir ./configs && cp -r $VIMCONFIG_DIR/* ./configs && \
    rm -r ./configs-bak

nvim "+PlugSnapshot! ./configs/plugins_snapshot.vim" "+qall"
