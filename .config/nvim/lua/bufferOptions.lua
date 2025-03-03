local opt = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>j', function() vim.cmd('bprevious') end, opt)
vim.keymap.set('n', '<leader>k', function() vim.cmd('bnext') end, opt)
vim.keymap.set('n', '<leader>x', function() vim.cmd('bd') end, opt)
