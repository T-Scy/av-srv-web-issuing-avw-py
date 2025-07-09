/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./templates/**/*.html",
    "./app/static/**/*.js",
    "./app/**/*.html",
    "./app/**/*.js",
    "./app/**/*.py"
  ],
  safelist: [
    'peer-checked:translate-x-5',
    'peer-checked:bg-indigo-600',
    'transition-colors',
    'transition-transform',
    'duration-300',
    'transform',
  ],
  darkMode: false,
  theme: {
    extend: {
      fontFamily: {
        pf: ['"PF Square Sans Pro"', 'sans-serif'],
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
