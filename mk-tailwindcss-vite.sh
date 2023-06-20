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

pnpm install --save-dev  eslint-config-prettier eslint-plugin-prettier
pnpm install --save-dev  eslint-plugin-tailwindcss
pnpm install --save-dev  eslint-plugin-react@latest

cp ../.gitignore .


# optional
#npm install --save-dev @heroicons/react @tailwindcss/forms
