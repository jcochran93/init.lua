local dap = require("dap")
local dapui = require("dapui")

require("dapui").setup()

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end
vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<Leader>dc", dap.continue, {})

require('dap-cs').setup({
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
dap_configurations = {
    {
      type = "coreclr",
      name = "Launch with launchSettings.json",
      request = "launch",
      program = function()
        -- Path to your dotnet executable
        return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '\\bin\\Debug/', 'file')
      end,
      cwd = "${workspaceFolder}",
      -- This is where you can pull in launchSettings.json values
      env = function()
        local launch_settings_file = vim.fn.getcwd() .. "\\Properties\\launchSettings.json"
        local env_vars = {}
        
        if vim.fn.filereadable(launch_settings_file) == 1 then
          local launch_settings = vim.fn.json_decode(vim.fn.readfile(launch_settings_file))
          local profile_name = vim.fn.input('Profile name: ', '')
          
          if launch_settings.profiles and launch_settings.profiles[profile_name] then
            local profile = launch_settings.profiles[profile_name]
            if profile.environmentVariables then
              env_vars = profile.environmentVariables
            end
          end
        end
        
        return env_vars
      end,
    },
  },
  netcoredbg = {
    -- the path to the executable netcoredbg which will be used for debugging.
    -- by default, this is the "netcoredbg" executable on your PATH.
    path = "C:\\Users\\JarredCochran\\scoop\\shims\\netcoredbg.exe",
  }
})
