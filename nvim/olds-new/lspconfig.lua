local M = {'neovim/nvim-lspconfig'}

M.requires = {
  require('specs.lsp.saga'),
  require('specs.lsp.colors'),
  require('specs.lsp.trouble'),
  require('specs.lsp.kind'),
  {'nvim-lua/plenary.nvim'}
}

M.cond = function()
  return require('specs.lsp.utils').is_enabled()
end

M.setup = function()
  -- see https://github.com/nvim-lua/diagnostic-nvim/issues/73
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {underline = true, signs = false, virtual_text = false}
  )
end

M.config = function()
  vim.lsp.handlers['textDocument/formatting'] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
      return
    end
    if not vim.api.nvim_buf_get_option(bufnr, 'modified') then
      local view = vim.fn.winsaveview()
      vim.lsp.util.apply_text_edits(result, bufnr)
      vim.fn.winrestview(view)
      if bufnr == vim.api.nvim_get_current_buf() then
        vim.api.nvim_command('noautocmd :update')
      end
    end
  end

  local lsputil_config = require('specs.lsp.config')

  local filetypes = {
    'typescript',
    'typescriptreact',
    'javascript',
    'javascriptreact',
    'json',
    'yaml',
    'markdown'
  }

  local efm_formatters = {
    prettier = {
			formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT}',
			formatStdin = true,
			rootMarkers = {'package.json', '.git/'},
		},
    shfmt = {
      formatCommand = 'shfmt -i 2 -bn -ci -sr',
      formatStdin = true
    }
  }

  local formatters = {
    typescript = { efm_formatters.prettier },
    typescriptreact = { efm_formatters.prettier },
    javascript = { efm_formatters.prettier },
    javascriptreact = { efm_formatters.prettier },
    markdown = { efm_formatters.prettier },
    yaml = { efm_formatters.prettier },
    json = { efm_formatters.prettier },
    sh = { efm_formatters.shfmt }
  }

  local configs = {
    cssls = {},
    yamlls = {},
    jsonls = {},
    efm = {
      init_options = { documentFormatting = true },
      filetypes = filetypes,
      settings = {
        rootMarkers = {'.git/'},
        languages = formatters
      }
    },
    sumneko_lua = {
      cmd = {'lua-language-server'},
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT'},
          diagnostics = { globals = {'use', 'vim'} },
          workspace = {
            library = require('specs.lsp.langs.lua').get_available_runtimes(),
            maxPreload = 1000,
            preloadFileSize = 1000
          }
        }
      }
    },
    tsserver = {
      on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
      end
    }
  }

  local denylist = {}
  local function on_attach(client, bufnr)
    local base_config = { buffer = bufnr }

    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
      vim.api.nvim_command [[augroup END]]
    end

    local utils = require('utils')
    local map_opts = {silent = true, noremap = true}
    utils.map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', map_opts)
    utils.map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', map_opts)
    utils.map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', map_opts)
    utils.map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', map_opts)
    utils.map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', map_opts)
    utils.map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', map_opts)
    utils.map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', map_opts)
    utils.map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', map_opts)
    utils.map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', map_opts)
    utils.map('n', '<space>q', '<cmd>LspTroubleToggle<cr>', map_opts)

    lsputil_config.run_attachments(client, bufnr)
  end

  for server_name, server_opts in pairs(configs) do
    if denylist[server_name] then
      goto continue
    end

    local local_attach = server_opts.on_attach
    if local_attach ~= nil then
      server_opts.on_attach = function(client)
        local_attach(client)
        on_attach(client)
      end
    else
      server_opts.on_attach = on_attach
    end

    lsputil_config.setup_server(server_name, server_opts)

    ::continue::
  end
end

return M
