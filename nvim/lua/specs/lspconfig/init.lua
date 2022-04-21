local M = {'neovim/nvim-lspconfig'}

M.requires = {
  'kabouzeid/nvim-lspinstall',
  require('specs.lspconfig.lsp-colors'),
  require('specs.lspconfig.lsp-kind'),
  require('specs.lspconfig.lsp-saga'),
  require('specs.lspconfig.lsp-trouble'),
}

M.setup = function()
  -- see https://github.com/nvim-lua/diagnostic-nvim/issues/73
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { underline = true, signs = false, virtual_text = false }
  )
end

M.config = function()
  local function on_attach(client, bufnr)
    local base_config = { buffer = bufnr }

    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
      vim.api.nvim_command [[augroup END]]
    end

    if client.resolved_capabilities.document_highlight then
      vim.api.nvim_exec([[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]], false)
    end

    local map = require('main.utils').map
    local map_opts = {silent = true, noremap = true}

    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', map_opts)
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', map_opts)
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', map_opts)
    map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', map_opts)
    map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', map_opts)
    map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', map_opts)
    map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', map_opts)
    map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', map_opts)
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', map_opts)
    map('n', '<space>q', '<cmd>LspTroubleToggle<cr>', map_opts)
  end

  local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
      }
    }

    return {
      -- enable snippet support
      capabilities = capabilities,
      -- map buffer local keybindings when the language server attaches
      on_attach = on_attach,
    }
  end

  local function setup_servers()
    require('lspinstall').setup()

    local lspconfig = require('lspconfig')
    local servers = require('lspinstall').installed_servers()

    for _, server in pairs(servers) do
      local config = make_config()

      if server == 'lua' then
        local lua_settings = require('specs.lspconfig.luaconf')
        config.settings = lua_settings
        config.root_dir = function(fname)
          if fname:match('lush_theme') ~= nil then return nil end
          local util = require('lspconfig/util')
          return util.find_git_ancestor(fname) or util.path.dirname(fname)
        end
      end

      if server == 'efm' then
        config = vim.tbl_extend('force', config, require('specs.lspconfig.efm'))
      end

      if server == 'typescript' then
        config.on_attach = function(client)
          client.resolved_capabilities.document_formatting = false
        end
      end

      lspconfig[server].setup(config)
    end
  end

  setup_servers()

  -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
  require('lspinstall').post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
  end
end

return M