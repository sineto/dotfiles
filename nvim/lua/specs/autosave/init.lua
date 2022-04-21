local M = {'Pocco81/AutoSave.nvim'}

-- load autosave only if its globally enabled 'nvim/init.lua'
M.cond = function()
  return vim.g.auto_save == true
end

M.config = function()
  local autosave = require("autosave")

  autosave.setup({
    enabled = vim.g.auto_save, -- takes boolean value from init.lua
    execution_message = "autosaved at: " .. vim.fn.strftime("%H:%M:%S"),
    events = {"InsertLeave"},
    conditions = {
      exists = true,
      filetype_is_not = {},
      modifiable = true
    },
    write_all_buffers = false,
    on_off_commands = true,
    clean_command_line_interval = 2500
  })
end

return M