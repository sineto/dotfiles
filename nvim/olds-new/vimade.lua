local M = {'TaDaa/vimade'}

M.requires = {
}

M.config = function()
  vim.g.vimade = {
    enablefocusfading = 1
  }

  vim.cmd([[
    augroup SemiDimPerWin
      au!
      au WinLeave * call OnWinLeave()
      au WinEnter * call OnWinEnter()
      au! TextChangedI,TextChanged * call UpdateBufferAsync()
    augroup END


    function! OnWinEnter ()
      VimadeFadeActive
      VimadeWinDisable
    endfunction
    function! OnWinLeave ()
      VimadeWinEnable
    endfunction

    function! UpdateBufferAsync ()
      if exists('g:update_vimade')
        return
      endif
      let g:update_vimade = timer_start(1, 'DoUpdateBuffer') "change the timer value from 1 to whatever to help with performance
    endfunction

    function! DoUpdateBuffer (w)
      unlet g:update_vimade
      call vimade#BufDisable()
      call vimade#BufEnable()
    endfunction
  ]])
end

return M