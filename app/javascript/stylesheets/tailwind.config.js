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
      lime: colors.lime,
      gray: colors.coolGray,
    }
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
