const colors = require('tailwindcss/colors')

module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      orange: colors.orange,
      red: colors.red,
      lime: colors.lime,
    }
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
