#!/bin/sh
git clone git@github.com:allanchangcl/next-react-jest-starter-pack-paulintrognon.git $1
if [ $# -eq 0 ]
  then
      cd next-react-jest-starter-pack-paulintrognon
else
    cd $1
fi
yarn install
yarn husky install
~/webdev/tooling/starters/javascript/setuptestlintingts.sh