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
        primaryBg: '#FBFBF7',
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
        'paradiso': {
          '50': '#F2FAFA',
          '100': '#E4F2F2',
          '200': '#BFE0E0',
          '300': '#9BCBCC',
          '400': '#62A5A6',
          '500': '#347E7F',
          '600': '#2A6E73',
          '700': '#1D565E',
          '800': '#13404D',
          '900': '#0A2B38',
          '950': '#041824'
        }
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
