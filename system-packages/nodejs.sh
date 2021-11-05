# Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

nvm use --lts

npm i -g dotenv-cli

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
