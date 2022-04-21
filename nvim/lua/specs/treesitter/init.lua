local M = {'nvim-treesitter/nvim-treesitter'}

M.config = function()
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      "javascript",
      "typescript",
      "tsx",
      "vue",
      "html",
      "css",
      "scss",
      "bash",
      "lua",
      "json",
      "yaml",
      "python",
      "go"
    },
    highlight = {
      enable = true,
      use_languagetree = true
    },
    indent = {
      enable = true,
    },

    -- Plugins
    context_commentstring = {
        enable = true,
    },
    autotag = {
        enable = true,
    }
  })
end

M.run = ':TSUpdate'

return M