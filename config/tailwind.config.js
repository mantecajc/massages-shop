// Color shades generator: https://javisperez.github.io/tailwindcolorshades/

const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.{erb,haml,html,slim,rb}'
  ],
  theme: {
    extend: {
      fontFamily: {
        'charmonman': ['Charmonman', 'cursive'],
        'comfortaa': ['Comfortaa'],
        'inter': ['Inter'],
      },
      colors: {
        titleGray: '#2D2E36',
        footerBg: '#F0C9BE',
        'snow-drift': {
          '50': '#FFFFFF',
          '100': '#FFFFFF',
          '200': '#FFFFFF',
          '300': '#FCFCFA',
          '400': '#FCFCFA',
          '500': '#FBFBF7',
          '600': '#E0DFC5',
          '700': '#BAB488',
          '800': '#968A59',
          '900': '#705F31',
          '950': '#473514'
        },
        'ripe-lemon': {
          '50': '#FFFEF2',
          '100': '#FCFBE3',
          '200': '#FAF6BB',
          '300': '#F5EE93',
          '400': '#F0E248',
          '500': '#E8D000',
          '600': '#D1B200',
          '700': '#AD8800',
          '800': '#8C6500',
          '900': '#694400',
          '950': '#422700'
        },
        'fun-green': {
          '50': '#ebf7f4',
          '100': '#daf0e9',
          '200': '#a7d9c7',
          '300': '#78bfa3',
          '400': '#349164',
          '500': '#08622f',
          '600': '#065728',
          '700': '#04471e',
          '800': '#033b16',
          '900': '#022b0f',
          '950': '#011c08'
        },
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
