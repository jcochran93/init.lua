local function get_os()
    if jit.os == "Windows" then
        return {
            path = "~/Documents/Obsidian/Personal Vault/",
            -- Windows-specific settings
        }
    elseif jit.os == "OSX" then
        return {
            path = "/Users/jarred/Documents/Obsidian/Vault",
            -- Mac-specific settings
        }
    else
        return {
            path = "/default/fallback/path",
            -- Fallback settings
        }
    end
end

-- require('telekasten').setup({
--   home = vim.fn.expand(get_os().path), -- Put the name of your notes directory here
-- })
