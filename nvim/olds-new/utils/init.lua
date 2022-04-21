local utils = {}
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

function utils.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function utils.map_leader_keys(mappings, mode)
  for map, cmd in pairs(mappings) do
    utils.map(mode or 'n', string.format('<leader>%s', map), cmd)
  end
end

function utils.register_guides(labels)
  local tmp = vim.g.lmap or {}
  vim.g.lmap = vim.tbl_deep_extend('force', tmp, labels)
end

function utils.augroup(autocmds, name)
    print(autocmds)
    cmd('augroup ' .. name)
    cmd('autocmd!')
    for _, autocmd in ipairs(autocmds) do
      cmd('autocmd ' .. table.concat(autocmd, ' '))
    end
    cmd('augroup END')
end

function utils.is_buffer_empty()
  -- Check whether the current buffer is empty
  return vim.fn.empty(vim.fn.expand('%:t')) == 1
end

function utils.has_width_gt(cols)
  -- Check if the windows width is greater than a given number of columns
  return vim.fn.winwidth(0) / 2 > cols
end

return utils
