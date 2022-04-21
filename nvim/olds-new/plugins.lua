require('utils.packer').bootstrap()

local config = {
  git = {
    clone_timeout = 300 -- 5 minutes
  },
  display = {
    open_fn = require('packer.util').float,
  }
}

return require('packer').startup({function()
  use(require('specs.packer'))

  -- CODE INTELLISENSE
  -- use(require('specs.treesitter'))
  -- use(require('specs.lspconfig'))
  -- use(require('specs.compe'))

  -- -- VISUAL IDE
  -- use(require('specs.sinokai'))
  -- use(require('specs.galaxyline'))
  -- use(require('specs.barbar'))
  -- -- use(require('specs.tree'))
  -- -- use(require('specs.nerdtree'))
  -- use(require('specs.fzf'))
  -- use(require('specs.fterm'))
  -- -- use(require('specs.olds.treesitter-playground'))

  -- -- CODE BEHAVIOR
  -- use(require('specs.autopairs'))
  -- use(require('specs.move'))
  -- use('tpope/vim-commentary')
  -- use('tpope/vim-surround')
  -- use('kana/vim-textobj-user')
  -- use('kana/vim-textobj-line')
  -- use('sgur/vim-textobj-parameter')

  -- -- IDE BEHAVIOR
  -- use(require('specs.tmux-navigator'))
  -- use(require('specs.winresizer'))
  -- use(require('specs.vimade'))
  -- use(require('specs.hexokinase'))
  -- use('psliwka/vim-smoothie')
  -- use('dhruvasagar/vim-zoom')
  -- use('thaerkh/vim-workspace')

  -- -- COMMAND SUPPORT
  -- use('tpope/vim-eunuch')
  -- use('duggiefresh/vim-easydir')
  -- use('moll/vim-bbye')
end,
config = config})
