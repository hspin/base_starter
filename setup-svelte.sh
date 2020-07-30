#!/usr/bin/env bash

DIR=$(pwd)
HNAME=${PWD##*/}

newname="${HNAME// /-}"
HNAME=$( echo -n "${newname}" | sed 's/^ *//;s/ *$//' )-svelte

npx degit sveltejs/template "${HNAME}" &

BACK_PID=$!
while kill -0 $BACK_PID ; do
    echo "Process is still active..."
    sleep 1
    # You can add a timeout here if you want
done

sleep 1

cd "${HNAME}"

ls

npm install

sleep 1

DIR=./node_modules/prettier-plugin-svelte

if [ ! -d "${DIR}" ]; then
  echo "install support"
  npm install --save-dev prettier eslint prettier-plugin-svelte eslint-plugin-svelte3 babel-eslint
  BACK_PID=$!
  while kill -0 $BACK_PID ; do
    echo "Process is still active..."
    sleep 1
    # You can add a timeout here if you want
  done
  sleep 1
fi

# *************************************

printf '{
  "env": {
    "browser": true,
    "es6": true
  },
  "parser": "babel-eslint",
  "parserOptions": {
    "ecmaVersion": 2019,
    "sourceType": "module"
  },
  "plugins": ["svelte3"],
  "extends": ["eslint:recommended"],
  "overrides": [
    {
      "files": ["**/*.svelte"],
      "processor": "svelte3/svelte3"
    }
  ]
}' > .eslintrc

# *************************************

printf 'rollup.config.js
setupTypeScript.js' > .eslintignore

# *************************************

printf '{
  "tabWidth": 2,
  "semi": true,
  "singleQuote": true,
  "trailingComma": "es5",
  "plugins": ["prettier-plugin-svelte"]
}' > .prettierrc

# *************************************

printf '{
  "libs": [
    "browser"
  ],
  "plugins": {
    "es_modules": {}
  }
}' > .tern-project


# *************************************
# fix pluging output to buffer
# *************************************
# https://github.com/sveltejs/prettier-plugin-svelte/issues/57

FILE=./node_modules/prettier-plugin-svelte/plugin.js
BAK=./node_modules/prettier-plugin-svelte/plugin.js.bak

if [ ! -f "${BAK}" ]; then
  cp "${FILE}" "${BAK}"
  echo "done"
  sed -i 's/console.log(.*)\;//g' ./node_modules/prettier-plugin-svelte/plugin.js
  printf 'npm run dev'
  exit
fi
echo "already ready"

printf 'npm run dev'
