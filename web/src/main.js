// Import the createApp function from Vue library
import { createApp } from 'vue'
import { createPinia } from 'pinia'
import { createI18n } from 'vue-i18n'

// Import the CSS file for our app's styling
import './style.css'

// Import the root component for our app
import App from './App.vue'

// Import translations
import tr from './locales/tr.json'
import en from './locales/en.json'

// Create i18n instance
const i18n = createI18n({
  legacy: false,
  locale: 'tr', // Default language
  fallbackLocale: 'en',
  messages: {
    tr,
    en
  }
})

// Create Pinia store
const pinia = createPinia()

// Create a new Vue app instance with plugins
const app = createApp(App)

// Register plugins
app.use(pinia)
app.use(i18n)

// Mount the app to the #app element in our HTML
app.mount('#app')
