# Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
cp ./default-packages $NVM_DIR/

nvm use --lts

npm i -g dotenv-cli

# JSON LSP
npm i -g vscode-langservers-extracted

# Yaml LSP
npm i -g yarn
yarn global add yaml-language-server

# Node.js
npm install -g typescript \
  typescript-language-server \
  diagnostic-languageserver \
  eslint_d eslint prettier \
  eslint-config-prettier eslint-plugin-prettier
