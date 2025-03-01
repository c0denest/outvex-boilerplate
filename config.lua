Config = {}

-- General Settings
Config.Debug = true -- Enable/disable debug mode
Config.Locale = 'tr' -- Default language (tr, en, etc.)

-- UI Settings
Config.UI = {
    defaultKey = 249, -- Default key to open/close NUI (249 = N key)
    autoOpen = false, -- Automatically open NUI when script starts
    allowEscapeToClose = true -- Allow ESC key to close NUI
}

-- Keymaster Settings
Config.Keymaster = {
    enabled = true, -- Enable/disable Keymaster support
    licenseKey = "YOUR_LICENSE_KEY" -- Keymaster license key
}

-- Escrowed Settings
Config.Escrowed = {
    enabled = true, -- Enable/disable Escrowed support
    ignoreFiles = { -- Files to exclude from Escrow
        'locales/*.lua',
        'config.lua',
        'README.md'
    }
}

-- Framework Integration
Config.Framework = {
    type = 'standalone', -- 'esx', 'qb', 'standalone'
    useOxLib = true -- Enable ox_lib usage
}