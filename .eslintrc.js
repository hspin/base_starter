module.exports = {
  root: true,
  extends: [
    'eslint:recommended',
    'plugin:react-hooks/recommended',
    'prettier',
  ],
  plugins: [
    'react-refresh',
  ],
  env: {
    browser: true,
    es2022: true,
    jest: true,
    node: true,
  },
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module',
  },
  rules: {
    // OVERRIDES FOR 'eslint:recommended'
    'no-unused-vars': ['error', { caughtErrors: 'all' }], // Don't allow unused error argument in catch blocks
    // WARNINGS
    'no-console': 'warn',
    'no-alert': 'warn',
    // PROBLEMS
    'no-duplicate-imports': 'error',
    'react/jsx-filename-extension': [2, { 'extensions': ['.js', '.jsx', '.ts', '.tsx'] }],
  },
}
