#!/usr/bin/env bash

DIR=$(pwd)

NAME="${1:-my-app}"

echo $NAME

# pnpm create vite "${NAME}" --template react-ts
pnpm create vite "${NAME}" --template react

cd "${NAME}"

pnpm install

pnpm install --save-dev tailwindcss postcss autoprefixer

pnpx tailwindcss init -p

echo "@tailwind base;
@tailwind components;
@tailwind utilities;" > index.css

sed -i 's#content.*#content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx}", ],#g' tailwind.config.js

pnpm install --save-dev eslint eslint-config-prettier
pnpm install --save-dev prettier prettier-plugin-tailwindcss
pnpm install --save-dev eslint-plugin-react@latest

cp ../.gitignore .
cp ../.tailwind.config.js tailwind.config.js

cp ../.prettierignore .
cp ../.prettier.config.js .
cp ../.jsconfig.json my-jsconfig.json

 cp ../.eslintignore .
 cp ../.eslintrc.js my-eslintrc.js


# optional
#npm install --save-dev @heroicons/react @tailwindcss/forms
