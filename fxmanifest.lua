-- Set the FX version and game type
fx_version "cerulean"
game "gta5"

-- Resource metadata
author "c0denest"
description "Vite, Vue & TailwindCSS boilerplate made for FiveM with keymaster, escrowed and locale support."
version "2.0"

-- Define client-side scripts
client_scripts {
    "client/main.lua"
}

-- Define server-side scripts
server_scripts {
    "server/main.lua"
}

-- Define scripts shared between client and server
shared_scripts {
    "config.lua",
    "@ox_lib/init.lua",
    "locales/*.lua"
}

-- Locale configuration
lua54 'yes'
use_experimental_fxv2_oal 'yes'
escrow_ignore {
    'locales/*.lua',
    'config.lua',
    'README.md'
}

-- Define files that should be included in the resource
files {
    "web/dist/**",
    "locales/*.lua"
}

-- Set the UI page to be displayed
ui_page "web/dist/index.html"

-- Keymaster and escrow support
provide "outvex-boilerplate"
dependency "ox_lib"