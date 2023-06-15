const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        'charmonman': ['Charmonman', 'cursive'],
        'comfortaa': ['Comfortaa'],
        'inter': ['Inter'],
      },
      colors: {
        primaryGreen: '#347E7F',
        titleGray: '#2D2E36',
        primaryBg: '#FBFBF7',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/line-clamp'),
    require('@tailwindcss/container-queries'),
  ]
}
