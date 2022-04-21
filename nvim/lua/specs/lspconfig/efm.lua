local prettier  = {
  formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT}',
  formatStdin = true,
  rootMarkers = {'package.json', '.git/'},
}

local eslint = {
  lintCommand = "./node_modules/.bin/eslint -f visualstudio --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m" }
}

local languages = {
  javascript = { prettier, eslint },
  typescript = { prettier, eslint },
  typescriptreact = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  ["javascript.jsx"] = { prettier, eslint },
  ["typescript.tsx"] = { prettier, eslint },
  vue = { prettier, eslint },
  html = { prettier },
  css = { prettier },
  json = { prettier },
  yaml = { prettier },
  markdown = { prettier }
}

return {
  filetypes = vim.tbl_keys(languages),
  init_options = { documentFormatting = true },
  settings = { rootMarkers = { './git' }, languages = languages }
}