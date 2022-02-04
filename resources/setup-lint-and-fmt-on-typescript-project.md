# Setup lint and formatter on a typescript project

## Install eslint & Answer questions
```
npm install -D eslint
npx eslint --init
```
### Recommended .eslintrc file for react project
```json
{
    "env": {
        "browser": true,
        "es2021": true
    },
    "extends": [
        "plugin:react/recommended",
        "plugin:prettier/recommended"
    ],
    "parser": "@typescript-eslint/parser",
    "parserOptions": {
        "ecmaFeatures": {
            "jsx": true,
            "tsx": true
        },
        "ecmaVersion": "latest",
        "sourceType": "module",
        "project": "./tsconfig.json"
    },
    "plugins": [
        "react",
        "@typescript-eslint",
        "prettier"
    ],
    "rules": {
        "prettier/prettier": "error"
    }
}
```

## Integrate with formatter (prettier)

### Install dependencies
```
npm install -D prettier eslint-config-prettier eslint-plugin-prettier
```

### Configure project
Follows https://www.npmjs.com/package/eslint-plugin-prettier
