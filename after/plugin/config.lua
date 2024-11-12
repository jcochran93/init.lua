-- config.lua
local function get_config()
    if jit.os == "Windows" then
        return {
            path = "~/Documents/Obsidian/Personal Vault/",
            -- Windows-specific settings
        }
    elseif jit.os == "macOS" then
        return {
            path = "/Users/YourUsername/config",
            -- Mac-specific settings
        }
    else
        return {
            path = "/default/fallback/path",
            -- Fallback settings
        }
    end
end

return get_config()
