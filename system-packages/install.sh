# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install cargo-watch
cargo install cargo-edit

brew install rust-analyzer

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

nvm install --lts

# Typescript LSP
npm install -g typescript \
  typescript-language-server \
  diagnostic-languageserver \
  eslint_d prettier prettier-eslint prettier-eslint-cli

# JSON LSP
npm i -g vscode-langservers-extracted

# Yaml LSP
npm i -g yarn
yarn global add yaml-language-server
