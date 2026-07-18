# 🎨 Color Matcher

A color-palette generator built with **Ruby on Rails**, **Tailwind CSS**, and **JavaScript**, designed to help designers and developers quickly find harmonious color combinations for their projects.

🔗 **Live demo:** [color-matchers.netlify.app](https://color-matchers.netlify.app)

---

## ✨ Features

- 🎯 Generate color palettes from any base color
- 🌈 Multiple harmony modes:
  - **Analogous** — colors next to each other on the color wheel
  - **Triadic** — three evenly spaced colors for high contrast
  - **Tints** — base color mixed with white for lighter variations
  - **Shades** — base color mixed with black for darker variations
- ⚡ Instant, interactive palette preview
- 📋 Easy to copy generated color codes for use in design tools or code

---

## 🛠️ Tech Stack

| Layer        | Technology |
|--------------|------------|
| Back-End     | Ruby on Rails |
| Styling      | Tailwind CSS |
| Interactivity | JavaScript |
| Deployment   | Docker |

---

## 🚀 Getting Started

### Prerequisites
- Ruby (see [`.ruby-version`](.ruby-version) for the required version)
- Bundler
- Node.js & npm (for Tailwind/JS assets)

### Installation

```bash
# Clone the repository
git clone https://github.com/NichakamonB/-Color-Matcher.git
cd -Color-Matcher

# Install Ruby dependencies
bundle install

# Install JS dependencies
npm install

# Set up the database
rails db:create db:migrate

# Start the development server
bin/dev
```

The app should now be running at `http://localhost:3000`.

---

## 📖 Usage

1. Enter or pick a base color.
2. Choose a harmony mode: **Analogous**, **Triadic**, **Tints**, or **Shades**.
3. View the generated palette instantly.
4. Copy the hex codes you want to use in your own designs.

---

## 📄 License

This project is open source. Feel free to explore, fork, and adapt it for your own use.

---

## 👤 Author

**Nichakamon Buaphan**
- GitHub: [@NichakamonB](https://github.com/NichakamonB)
- LinkedIn: [nichakamon-buaphan](https://linkedin.com/in/nichakamon-buaphan)
- Portfolio: [nichakamon-resume.netlify.app](https://nichakamon-resume.netlify.app)
