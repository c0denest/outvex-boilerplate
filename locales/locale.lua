Locales = {}

function _(str, ...)
    -- Get current language from config
    local locale = Config.Locale or 'en'
    
    -- Check locale table
    if Locales[locale] == nil then
        -- If specified language doesn't exist, fallback to English
        locale = 'en'
    end
    
    if Locales[locale][str] == nil then
        -- If translation not found, return string as-is
        return string.format(str, ...)
    end
    
    return string.format(Locales[locale][str], ...)
end

function _U(str, ...)
    return _(str, ...)
end 