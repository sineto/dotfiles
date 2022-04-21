local M = {'windwp/nvim-autopairs'}

M.requires = {
  require('specs.treesitter')
  { 'windwp/nvim-ts-autotag', requires = {require('specs.treesitter')} }
}

M.config = function()
  require('nvim-autopairs').setup({ check_ts = true })
  require('nvim-ts-autotag').setup()

  local Rule = require('nvim-autopairs.rule')
  local npairs = require('nvim-autopairs')
  local filetypes = {
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact'
  }

  npairs.add_rules({
    Rule(' ', ' ', filetypes):with_pair(function (opts)
      local pair = opts.line:sub(opts.col, opts.col+2)
      return vim.tbl_contains({'{}'}, pair)
    end)
  })

  _G.MUtils= {}

  vim.g.completion_confirm_key = ""
  MUtils.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0  then
      if vim.fn.complete_info()["selected"] ~= -1 then
        return vim.fn["compe#confirm"](npairs.esc("<cr>"))
      else
        return npairs.esc("<cr>")
      end
    else
      return npairs.autopairs_cr()
    end
  end

  local remap = vim.api.nvim_set_keymap
  remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
end

return M
