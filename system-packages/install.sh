# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Utils
## deps for fzf
brew install bat

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install cargo-watch
cargo install cargo-edit

brew install rust-analyzer

# github
brew install gh

# Node
bash ./nodejs.sh
