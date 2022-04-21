local M = {'romgrk/barbar.nvim'}

M.requires = {
  require('specs.webdevicons')
}

M.config = function()
  -- TODO: custom colors for inactive buffer modified
  vim.cmd([[
    let bufferline = get(g:, 'bufferline', {})
    let bufferline.icons = 'numbers'
    let bufferline.maximum_padding = 2
    let bufferline.no_name_title = '[Untitled]'

    nnoremap <silent>    <A-w> :BufferClose<cr>
    nnoremap <silent>    <A-a> :BufferPrevious<cr>
    nnoremap <silent>    <A-s> :BufferNext<cr>

    nnoremap <silent>    <A-<> :BufferMovePrevious<cr>
    nnoremap <silent>    <A->> :BufferMoveNext<cr>

    nnoremap <silent>    <leader>1 :BufferGoto 1<cr>
    nnoremap <silent>    <leader>2 :BufferGoto 2<cr>
    nnoremap <silent>    <leader>3 :BufferGoto 3<cr>
    nnoremap <silent>    <leader>4 :BufferGoto 4<cr>
    nnoremap <silent>    <leader>5 :BufferGoto 5<cr>
    nnoremap <silent>    <leader>6 :BufferGoto 6<cr>
    nnoremap <silent>    <leader>7 :BufferGoto 7<cr>
    nnoremap <silent>    <leader>8 :BufferGoto 8<cr>
    nnoremap <silent>    <leader>9 :BufferLast<cr>
  ]])
end

return M