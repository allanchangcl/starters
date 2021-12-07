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
    "plugin:prettier/recommended",
    "plugin:@typescript-eslint/recommended"
  ],
  "plugins": [
    "prettier",
    "@typescript-eslint"
  ],
  "rules": {
    "eqeqeq": "error",
    "no-console": "warn",
    "no-undef": "off",
    "no-unused-vars": "off",
    "prettier/prettier": "error",
    "@typescript-eslint/explicit-module-boundary-types": "off",
    "@typescript-eslint/explicit-function-return-type": "off",
    "@typescript-eslint/no-explicit-any": "error",
    "@typescript-eslint/no-unused-vars": "warn"
  },
  "parser": "@typescript-eslint/parser",
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

cat <<EOF > testlinting.ts
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
yarn add -D prettier eslint-plugin-prettier eslint-config-prettier
yarn add -D @typescript-eslint/eslint-plugin @typescript-eslint/parser
# yarn add -D eslint-plugin-react eslint-plugin-react-hooks
yarn add -D typescript lint-staged husky
