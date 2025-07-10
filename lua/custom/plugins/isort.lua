return {
  'brentyi/isort.vim',
  config = function()
    vim.g.isort_vim_options = '--profile black'
    vim.api.nvim_exec2(
      [[
  augroup IsortMappings
    autocmd!
    autocmd FileType python nnoremap <buffer> <Leader>si :Isort<CR>
    autocmd FileType python vnoremap <buffer> <Leader>si :Isort<CR>
  augroup END
  ]],
      {}
    )
  end,
}
