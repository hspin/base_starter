module.exports = {
    root: true,
    env: {
        browser: true,
        es6: true,
        es2021: true
    },
    extends: [
        'eslint:recommended',
        'plugin:prettier/recommended',
        'plugin:tailwindcss/recommended',
        'plugin:react/recommended',
        'plugin:@typescript-eslint/recommended'
    ],
    parserOptions: {
        parser: '@typescript-eslint/parser',
        ecmaFeatures: {
            jsx: true
        },
        ecmaVersion: 'latest',
        sourceType: 'module'
    },
    plugins: [
        'react',
        'tailwindcss',
        '@typescript-eslint',
        'prettier'
    ],
    rules: {
        'react/react-in-jsx-scope': 'off',
        'prettier/prettier': ['error'],
        'camelcase': 'error',
        'spaced-comment': 'error',
        'quotes': ['error', 'single'],
        'no-duplicate-imports': 'error',
        'indent': [ 2, 2 ],
        'linebreak-style': [ 2, 'unix' ],
        'semi': [ 'error', 'always' ],
        'no-console': 0,
        'no-unused-vars': 0
    }
}
