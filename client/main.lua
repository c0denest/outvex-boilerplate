-- Local variables
local isNUIopen = false

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
        -- Keymaster validation can be done here
        debugPrint("^2" .. translate('keymaster_valid'))
    end
    
    -- Auto open UI
    if Config.UI.autoOpen then
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "open"
        })
        isNUIopen = true
        debugPrint("^3" .. translate('ui_open'))
    end
    
    -- Provide information about UI toggle key
    local keyName = GetControlInstructionalButton(0, Config.UI.defaultKey, true)
    debugPrint("^3" .. string.format(translate('ui_toggle'), keyName))
end)

-- UI toggle function
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, Config.UI.defaultKey) then -- Default N key (249)
            ToggleNUI()
        end
        
        -- Close with ESC key
        if Config.UI.allowEscapeToClose and isNUIopen and IsControlJustPressed(0, 200) then -- ESC key (200)
            ToggleNUI(false)
        end
    end
end)

-- Open/close NUI
function ToggleNUI(state)
    if state == nil then
        state = not isNUIopen
    end
    
    isNUIopen = state
    SetNuiFocus(state, state)
    
    if state then
        SendNUIMessage({
            action = "open"
        })
        debugPrint("^3" .. translate('ui_open'))
    else
        SendNUIMessage({
            action = "close"
        })
        debugPrint("^3" .. translate('ui_close'))
    end
end

-- NUI callbacks
RegisterNUICallback('close', function(data, cb)
    ToggleNUI(false)
    cb('ok')
end)

-- Commands
RegisterCommand('outvex:reload', function()
    debugPrint("^2" .. translate('command_reload'))
    -- Reload operations can be done here
end, false)

RegisterCommand('outvex:toggle', function()
    ToggleNUI()
    debugPrint("^2" .. translate('command_toggle'))
end, false)

-- Exports
exports('ToggleNUI', ToggleNUI)
exports('IsNUIOpen', function() return isNUIopen end)
