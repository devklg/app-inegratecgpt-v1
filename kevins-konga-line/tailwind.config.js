/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        'mw-dark': '#1a1a1a',
        'mw-card': '#2a2a2a',
        'mw-gold': '#b7a131',
        'mw-blue': '#3588ce',
        'mw-darkblue': '#118277',
        'mw-red': '#b72515',
      },
      fontFamily: {
        'sans': ['Open Sans', 'sans-serif'],
        'display': ['Montserrat', 'sans-serif'],
      },
      animation: {
        'bounce-slow': 'bounce 3s infinite',
        'pulse-slow': 'pulse 4s cubic-bezier(0.4, 0, 0.6, 1) infinite',
      },
      backgroundImage: {
        'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
      }
    },
  },
  plugins: [],
}
