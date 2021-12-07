#!/bin/sh
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

# yarn add -D eslint prettier eslint-plugin-prettier eslint-config-prettier
# yarn add -D @typescript-eslint/eslint-plugin @typescript-eslint/parser
# yarn add -D eslint-plugin-react eslint-plugin-react-hooks
# yarn add -D typescript lint-staged husky
