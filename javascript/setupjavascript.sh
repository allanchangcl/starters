#!/bin/sh
# setup package.json
cat <<EOF > package.json
{
  "husky": {
    "hooks": {
      "pre-commit": "lint-staged"
    }
  },
  "lint-staged": {
    "*.{js,jsx,ts,tsx}": "yarn run lint:fix"
  },
  "scripts": {
    "lint": "eslint --cache \"src/**/*.{js,jsx,ts,tsx}\"",
    "lint:fix": "eslint --cache --fix \"src/**/*.{js,jsx,ts,tsx}\""
  }
}
EOF

# prettierrc config file
cat <<EOF > .prettierrc
{
  "useTabs": false,
  "tabWidth": 2,
  "singleQuote": true,
  "printWidth": 120,
  "trailingComma": "es5"
}
EOF

# eslintrc config file
cat <<EOF > .eslintrc
{
  "extends": [
    "eslint:recommended",
    "plugin:prettier/recommended"
  ],
  "plugins": [
    "prettier"
  ],
  "rules": {
    "eqeqeq": "error",
    "no-console": "warn",
    "prettier/prettier": "error"
  },
  "parser": "@babel/eslint-parser",
  "parserOptions": {
    "ecmaVersion": latest,
    "sourceType": "module",
    "requireConfigFile": false
  },
  "env": {
    "browser": true,
    "node": true,
    "es6": true,
    "jest": true
  },
  "ignorePatterns": [
    "node_modules",
    "build",
    "dist",
    "public"
  ]
}
EOF

cat <<EOF > testlinting.js
var foo = 1
console.log(foo)
var bar
bar = 1
function test(



    ) {
  console.log(baz)
}
var baz = 123

EOF

if [ ! -d ".vscode" ]; then mkdir .vscode; fi
cat <<EOF > .vscode/settings.json
{
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  ],
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true,
  },
  "editor.tabSize": 2,
}
EOF

cat <<EOF > .vscode/extensions.json
{
  "recommendations": [
    "dbaeumer.vscode-eslint"
  ]
}
EOF

yarn add eslint @babel/core @babel/eslint-parser -D
# yarn add -D eslint prettier eslint-plugin-prettier eslint-config-prettier
yarn add -D prettier eslint-plugin-prettier eslint-config-prettier
yarn add -D babel-eslint lint-staged husky
