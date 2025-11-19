
// config/tailwind.config.js
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/assets/stylesheets/**/*.css',
    './app/assets/tailwind/**/*.css'  // ถ้ามีไฟล์ CSS Tailwind
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}

