local M = {'lukas-reineke/indent-blankline.nvim'}

M.event = 'BufRead'
M.setup = function()
  vim.g.indentLine_enabled = 1
  vim.g.indent_blankline_char = "▏"

  vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard", "NvimTree"}
  vim.g.indent_blankline_buftype_exclude = {"terminal"}

  vim.g.indent_blankline_show_trailing_blankline_indent = false
  vim.g.indent_blankline_show_first_indent_level = true

  vim.g.indent_blankline_char_highlight_list = {'Fg1'}
end

return M