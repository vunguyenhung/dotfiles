# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file ./Brewfile

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install cargo-watch
cargo install cargo-edit

# Node
bash ./nodejs.sh

# Karabiner
cp -r ./karabiner ~/.config/karabiner
