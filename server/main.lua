-- Local variables
local resourceName = GetCurrentResourceName()
local isKeymasterValid = false

-- Debug function
local function debugPrint(message)
    if Config.Debug then
        print(message)
    end
end

-- Helper function for locale support
local function translate(key, ...)
    return _U(key, ...)
end

-- Startup message
Citizen.CreateThread(function()
    local asciiArt = [[                                                                
    _______/\\\\\_______/\\\________/\\\__/\\\\\\\\\\\\\\\__/\\\________/\\\__/\\\\\\\\\\\\\\\__/\\\_______/\\\_        
    _____/\\\///\\\____\/\\\_______\/\\\_\///////\\\/////__\/\\\_______\/\\\_\/\\\///////////__\///\\\___/\\\/__       
     ___/\\\/__\///\\\__\/\\\_______\/\\\_______\/\\\_______\//\\\______/\\\__\/\\\_______________\///\\\\\\/____      
      __/\\\______\//\\\_\/\\\_______\/\\\_______\/\\\________\//\\\____/\\\___\/\\\\\\\\\\\_________\//\\\\______     
       _\/\\\_______\/\\\_\/\\\_______\/\\\_______\/\\\_________\//\\\__/\\\____\/\\\///////___________\/\\\\______    
        _\//\\\______/\\\__\/\\\_______\/\\\_______\/\\\__________\//\\\/\\\_____\/\\\__________________/\\\\\\_____   
         __\///\\\__/\\\____\//\\\______/\\\________\/\\\___________\//\\\\\______\/\\\________________/\\\////\\\___  
          ____\///\\\\\/______\///\\\\\\\\\/_________\/\\\____________\//\\\_______\/\\\\\\\\\\\\\\\__/\\\/___\///\\\_ 
           ______\/////__________\/////////___________\///______________\///________\///////////////__\///_______\///__                                                                
    ]]

    -- Print ASCII art to console
    debugPrint(asciiArt)

    -- Print success message to console
    debugPrint("^2" .. translate('welcome') .. " ^5with Vue 3, Vite & TailwindCSS!")
    
    -- Framework integration
    if Config.Framework.type ~= 'standalone' then
        debugPrint("^3" .. string.format(translate('framework_loaded'), Config.Framework.type:upper()))
    end
    
    -- Keymaster check
    if Config.Keymaster.enabled then
        ValidateKeymaster()
    end
end)

-- Keymaster validation function
function ValidateKeymaster()
    if not Config.Keymaster.enabled then return true end
    
    -- Real keymaster validation can be implemented here
    -- Simple validation example:
    if Config.Keymaster.licenseKey ~= "YOUR_LICENSE_KEY" then
        isKeymasterValid = true
        debugPrint("^2" .. translate('keymaster_valid'))
    else
        isKeymasterValid = false
        debugPrint("^1" .. translate('keymaster_invalid'))
    end
    
    return isKeymasterValid
end

-- Commands
RegisterCommand('outvex:reload', function(source, args, rawCommand)
    local src = source
    -- Admin check
    if src > 0 and not IsPlayerAceAllowed(src, "command") then
        TriggerClientEvent('chat:addMessage', src, {
            color = {255, 0, 0},
            multiline = true,
            args = {"SYSTEM", translate('error_permission')}
        })
        return
    end
    
    -- Reload operations
    debugPrint("^2" .. translate('command_reload'))
end, false)

-- Exports
exports('IsKeymasterValid', function() return isKeymasterValid end)

-- Callbacks
lib.callback.register('outvex:getConfig', function(source)
    return Config
end)

-- Events
RegisterNetEvent('outvex:serverLog')
AddEventHandler('outvex:serverLog', function(message)
    if not Config.Debug then return end
    print(message)
end)
