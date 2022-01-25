#!/bin/sh
yarn create next-app --typescript $1

if [ $# -eq 0 ]
  then
      cd my-app
else
    cd $1
fi

if [ ! -d ".vscode" ]; then mkdir .vscode; fi
cat <<EOF > .vscode/settings.json
{
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true,
  },
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode"
}
EOF

cat <<EOF > .vscode/extensions.json
{
  "recommendations": [
    "dbaeumer.vscode-eslint"
  ]
}
EOF

# jq '. + {"rules": ({"prefer-const": "error"})}' .eslintrc.json >file.json.tmp && cp file.json.tmp .eslintrc.json

yarn add --dev @typescript-eslint/eslint-plugin
yarn add --dev prettier eslint-config-prettier

cat <<EOF > .eslintrc.json
{
  "plugins": ["@typescript-eslint"],
  "extends": [
    "next/core-web-vitals",
    "plugin:@typescript-eslint/recommended",
    "prettier"
  ],
  "rules": {
    "@typescript-eslint/no-unused-vars": "error",
    "@typescript-eslint/no-explicit-any": "error"
  }
}
EOF

cat <<EOF > .prettierrc.json
{
  "semi": false,
  "trailingComma": "es5",
  "singleQuote": true,
  "tabWidth": 2,
  "useTabs": false
}
EOF

yarn add --dev husky
yarn husky install
yarn husky add .husky/pre-commit "yarn tsc --noEmit && yarn eslint . && yarn prettier --write ."

yarn add --dev lint-staged
cat << "EOF" > lint-staged.config.json
// lint-staged.config.js
module.exports = {
  // Type check TypeScript files
  '**/*.(ts|tsx)': () => 'yarn tsc --noEmit',

  // Lint then format TypeScript and JavaScript files
  '**/*.(ts|tsx|js)': (filenames) => [
    `yarn eslint --fix ${filenames.join(' ')}`,
    `yarn prettier --write ${filenames.join(' ')}`,
  ],

  // Format MarkDown and JSON
  '**/*.(md|json)': (filenames) =>
    `yarn prettier --write ${filenames.join(' ')}`,
}
EOF

cat <<EOF > .husky/pre-commit
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"

yarn lint-staged
EOF
