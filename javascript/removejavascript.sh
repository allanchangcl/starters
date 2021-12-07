#!/bin/sh
if [ -d "node_modules" ]; then rm -Rf node_modules; fi
if [ -d ".vscode" ]; then rm -Rf .vscode; fi

if [ -f ".eslintrc" ]; then rm .eslintrc; fi
if [ -f ".prettierrc" ]; then rm .prettierrc; fi
if [ -f "package.json" ]; then rm package.json; fi
if [ -f "testlinting.js" ]; then rm testlinting.js; fi
if [ -f "testlinting.ts" ]; then rm testlinting.ts; fi
if [ -f "yarn.lock" ]; then rm yarn.lock; fi