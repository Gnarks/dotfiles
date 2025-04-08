-- setup basic vim config  

vim.g.mapleader = " " -- setup space as an leader (first key to touch before doing shortcuts)

vim.opt.number = true -- see line number
vim.opt.relativenumber = true -- relative numbers

-- tabs
vim.opt.tabstop = 2 -- tabs are 2 spaces
vim.opt.softtabstop = 2 -- ""
vim.opt.expandtab = true -- expand the tabs to spaces
vim.opt.shiftwidth = 2 -- shift value of indent operator

-- splits
vim.opt.splitbelow = true -- new windows opens below rather than above
vim.opt.splitright = true -- new windows opens to the right rather than the left

-- unwrapping the lines
vim.opt.wrap = true -- long lines don't wrap around they expand  

-- sync nvim clipboard and system clipboard
vim.opt.clipboard = "unnamedplus"

-- the windows move if the cursor's in the middle
vim.opt.scrolloff = 999

-- make it possible to move the cursor where there is no characters in visual block mode (ctrl + v)
vim.opt.virtualedit = "block"

-- shows the changes in string reformatting in a seperate window
vim.opt.inccommand = "split"

-- make autocompletion with lowercase in commands possible
vim.opt.ignorecase = true

-- permits colorschemes
vim.opt.termguicolors = true

vim.diagnostic.config({ virtual_text = true }) -- enable the virtual text on diagnostics

vim.g.maplocalleader = ',' -- setup the local leader for latex commands
