local mygroup = vim.api.nvim_create_augroup('vimrc', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.html',
  group = mygroup,
  command = 'set shiftwidth=4',
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.html',
  group = 'vimrc',  -- equivalent to group=mygroup
  command = 'set expandtab',
})

