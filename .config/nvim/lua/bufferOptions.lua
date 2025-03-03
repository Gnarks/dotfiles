local opt = { noremap = true, silent = true }
vim.keymap.set('n', '<S-j>', function() vim.cmd('bprevious') end, opt) -- move to the previous buffer with shift-j 
vim.keymap.set('n', '<S-k>', function() vim.cmd('bnext') end, opt) -- move to next buffer with shift-k
vim.keymap.set('n', '<S-x>', function() vim.cmd('bd | bprevious') end, opt) -- closes the current buffer with shift-x
