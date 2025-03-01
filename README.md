<p align="center">
  <img src="web/public/img/outvex-boilerplate.png" alt="outvex-boilerplate" width="300">
</p>

<p align="center">
Unlock your full development potential with the <a href="https://vitejs.dev/">Vite</a>, <a href="https://vuejs.org/">Vue 3</a> & <a href="https://tailwindcss.com/">TailwindCSS</a> boilerplate for FiveM. Featuring keymaster, escrowed, and locale support with modern technologies. Designed to streamline your workflow and boost your productivity, this powerful tool delivers lightning-fast performance and a sleek, modern design.
<p>

<p align="center">
    <img src="https://img.shields.io/badge/framework-standalone-important" alt="Framework">
    <img src="https://img.shields.io/badge/status-working-brightgreen.svg" alt="Status">
    <img src="https://img.shields.io/badge/version-2.0-blueviolet.svg" alt="Version 2.0">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License">
</p>

## Features
* Vite 5 for fast, modern builds
* Vue 3 for a powerful and intuitive UI development experience
* TailwindCSS 3 for easy, customizable styling
* Vue i18n for multilingual support
* Pinia for state management
* Keymaster license protection
* Escrowed support
* Locale (multilingual) support
* Notification system
* Customizable configuration options
* Lightweight and easy to use

## Recommended IDE Setup
[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

## Getting Started
To get started with using this boilerplate, follow these steps:

1. Clone this repository to your local machine.
2. Open the main directory of the cloned repository in your preferred editor.
3. CD into the "web" folder in your terminal by running `cd web`.
```sh
cd web
```
4. Install the dependencies by running `npm install`.
```sh
npm install
```

## Usage
To use this boilerplate, you can use the following commands in your terminal:

#### Compile and Hot-Reload for Development:
Use the following command to start the development server with hot-reload enabled:

```sh
npm run dev
```

This will compile the Vue.js files and start a local server that you can access in your browser. Any changes you make to the files will be automatically recompiled and the browser will refresh to show the changes.

#### Compile for Production:
Use the following command to compile the Vue.js files for production:

```sh
npm run build
```

This will compile the files and create a `dist` folder that contains the output. Once you've successfully compiled it, you can access your project in-game.

## Dark Mode
Now that dark mode is a first-class feature of many operating systems, it's becoming more and more common to design a dark version of your website to go along with the default design.

To make this as easy as possible, Tailwind includes a `dark` variant that lets you style your site differently when dark mode is enabled:

1. Launch your preferred editor and access the main directory of the cloned repository.
2. Locate and open the web/index.html file within the directory.
3. Toggle between the `dark` or `light` mode as desired.

## Locale (Multilingual) Support
This boilerplate provides multilingual support using Vue i18n. To add a new language:

1. Create a new language file in the `web/src/locales` folder (e.g., `de.json`).
2. Add translations.
3. Import the new language in the `web/src/main.js` file and add it to the i18n configuration.

## Keymaster and Escrowed Support
This boilerplate includes Keymaster and escrowed support to protect your FiveM scripts:

1. Configure Keymaster settings in the `config.lua` file.
2. Specify files to be excluded from escrowed.
3. Make the necessary configurations in the `fxmanifest.lua` file.

## Notification System
This boilerplate includes a notification system that can be used to provide information to the user:

```js
// Example of showing a notification
appStore.addNotification({
  type: 'success', // 'success', 'error', 'warning', 'info'
  title: 'Success',
  message: 'Operation completed successfully!'
});
```

## Contributing
Contributions are always welcome! If you would like to contribute to this project, please create a pull request or open an issue.

## License
This project is licensed under the MIT License. See the `LICENSE` file for more information.

## Credits
This boilerplate was created by <a href="https://github.com/loljoshie/lj-boilerplate" target="_blank">loljoshie</a> and updated by <a href="https://github.com/c0denest" target="_blank">c0denest</a>.
