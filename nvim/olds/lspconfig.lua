-- local M = {'neovim/nvim-lspconfig'}

-- M.requires = {
--   {'nvim-lua/plenary.nvim'},
--   {'jose-elias-alvarez/nvim-lsp-ts-utils'},
--   -- require('specs.lspkind')
-- }

-- M.setup = function()
--   vim.fn.sign_define('LspDiagnosticsSignError', {
--     text = '🅴',
--     texthl = 'LspDiagnosticsSignError',
--     linehl = '',
--     numhl = '',
--   })
--   vim.fn.sign_define('LspDiagnosticsSignWarning', {
--     text = '🆆',
--     texthl = 'LspDiagnosticsSignWarning',
--     linehl = '',
--     numhl = '',
--   })
--   vim.fn.sign_define('LspDiagnosticsSignInformation', {
--     text = '🅸',
--     texthl = 'LspDiagnosticsSignInformation',
--     linehl = '',
--     numhl = '',
--   })
--   vim.fn.sign_define('LspDiagnosticsSignHint', {
--     text = '🅷',
--     texthl = 'LspDiagnosticsSignHint',
--     linehl = '',
--     numhl = '',
--   })
-- end

-- M.config = function()
--   local nvim_lsp = require('lspconfig')

--   local on_attach = function(client, bufnr)
--     local buf_map = vim.api.nvim_buf_set_keymap
--     vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
--     vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
--     vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
--     vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
--     vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
--     vim.cmd("command! LspOrganize lua lsp_organize_imports()")
--     vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
--     vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
--     vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
--     vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
--     vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
--     vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
--     vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

--     buf_map(bufnr, "n", "gd", ":LspDef<CR>", {silent = true})
--     buf_map(bufnr, "n", "gr", ":LspRename<CR>", {silent = true})
--     buf_map(bufnr, "n", "gR", ":LspRefs<CR>", {silent = true})
--     buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>", {silent = true})
--     buf_map(bufnr, "n", "K", ":LspHover<CR>", {silent = true})
--     buf_map(bufnr, "n", "gs", ":LspOrganize<CR>", {silent = true})
--     buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>", {silent = true})
--     buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>", {silent = true})
--     buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>", {silent = true})
--     buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>", {silent = true})
--     buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>", {silent = true})

--     local ts_utils = require("nvim-lsp-ts-utils")
--     buf_map(bufnr, "i", ".", ".<C-x><C-o>")
--     ts_utils.setup {
--       -- debug = true,
--       enable_import_on_completion = true,
--       complete_parens = true,
--       signature_help_in_parens = true,
--       eslint_bin = "eslint_d",
--       eslint_enable_diagnostics = true,
--       enable_formatting = true,
--       formatter = "eslint_d",
--       formatter_args = {
--           "--fix-to-stdout", "--stdin", "--stdin-filename", "$FILENAME"
--       },
--       format_on_save = true,
--       update_imports_on_move = true
--     }
--     ts_utils.setup_client(client)
--     buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
--     buf_map(bufnr, "n", "gI", ":TSLspRenameFile<CR>")
--     buf_map(bufnr, "n", "gt", ":TSLspImportAll<CR>")
--     buf_map(bufnr, "n", "qq", ":TSLspFixCurrent<CR>")
--   end


--   nvim_lsp.tsserver.setup {
--     on_attach = function(client)
--       client.resolved_capabilities.document_formatting = false
--       on_attach(client)
--     end
--   }

--   local filetypes = {
--     typescript = 'eslint',
--     typescriptreact = 'eslint'
--   }

--   local formatFiletypes = {
--     typescript = 'prettier',
--     typescriptreact = 'prettier'
--   }

--   local linters = {
--     eslint = {
--       sourceName = 'eslint',
--       command = 'eslint_d',
--       root_patterns = {'.eslintrc', '.eslintrc.json', 'package.json'},
--       debounce = 100,
--       args = {'--stdin', '--stdin-filename', '%filepath', '--format', 'json'},
--       parseJson = {
--         errorsRoot = '[0].messages',
--         line = 'line',
--         column = 'column',
--         endLine = 'endLine',
--         endColumn = 'endColumn',
--         message = '${message} [${ruleId}]',
--         security = 'severity'
--       },
--       securities = {[2] = 'error', [1] = 'warning'}
--     }
--   }

--   local formatters = {
--     prettier = {
--       command = 'prettier',
--       args = {'--stdin-filepath', '%filepath'}
--     }
--   }

--   nvim_lsp.diagnosticls.setup {
--     on_attach = on_attach,
--     filetypes = vim.tbl_keys(filetypes),
--     init_options = {
--       filetypes = filetypes,
--       linters = linters,
--       formatters = formatters,
--       formatFiletypes = formatFiletypes
--     }
--   }
-- end

-- return M