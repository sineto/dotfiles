require('main.plugins.packer').bootstrap()

local config = {
  git = {
    clone_timeout = 300 -- 5 minutes
  },
  display = {
    open_fn = require('packer.util').float,
  }
}

-- Sections
-- 01   (Essential)
-- 02   (UI Related)
-- 03   (Fuzzy Search)
-- 04   (Completion)
-- 05   (Debug)
-- 06   (Syntax Highlighting)
-- 07   (Miscellaneous)
-- 08   (Git)

return require('packer').startup({function(use)
  -- [01] - Common
  use(require('specs.packer')) -- package manager
  use(require('specs.tmux-navigator')) -- tmux and neovim navigation
  use('nvim-lua/plenary.nvim')

  -- [10]
  use(require('specs.treesitter')) -- syntax highlighting
  use(require('specs.lspconfig')) -- language server
  use(require('specs.compe')) -- snippets and code completion
  use('nvim-treesitter/playground')

  -- [02] - UI
  use(require('specs.sinokai')) -- colourscheme
  use(require('specs.bufferline')) -- bufferline
  -- use(require('specs.galaxyline')) -- statusline
  use(require('specs.fterm')) -- terminal window
  use(require('specs.dashboard')) -- dashboard
  -- use(require('specs.vimade')) -- dim inactive window

  -- [03] - Find/Search
  use(require('specs.fzf')) -- fuzzy finder
  use(require('specs.telescope')) -- fuzzy finder -- TODO: customizations
  use(require('specs.tree')) -- file explorer
  use(require('specs.numb')) -- number picker

  -- [07] - Misc
  use(require('specs.winresizer')) -- resize window
  use(require('specs.scroll')) -- cursor scroll
  use(require('specs.indentline')) -- indentline guide
  use('tpope/vim-eunuch')
  use('duggiefresh/vim-easydir')

  -- [08] - Git
  use(require('specs.gitsigns')) -- git hunks
  use(require('specs.diffview')) -- git diff viewer
  use('lambdalisue/gina.vim')

  -- [09] - Edit
  use(require('specs.autopairs')) -- auto pairs
  use(require('specs.move')) -- move line
  use(require('specs.autosave')) -- autosave
  use(require('specs.commentary')) -- comment line
  -- use('tpope/vim-commentary') -- comment line
  -- use('JoosepAlviste/nvim-ts-context-commentstring') -- comment for typescript/react
  use('tpope/vim-surround')
  use('kana/vim-textobj-user')
  use('kana/vim-textobj-line') -- select line
  use('sgur/vim-textobj-parameter') -- select params

end, config = config})
