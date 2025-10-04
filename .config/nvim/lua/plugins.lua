-- setting lazy pacakge manager
-- the vim.fn to call a vim script in lua
-- the ".." is lua concatenation operator
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if the lazy.nvim file doesn't exit than create it
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- rtp : runtime path
-- looks in each file if it has code to run in a certain situation
-- prepend : adds the lazypath in the beginning of the runtime table
vim.opt.rtp:prepend(lazypath)
-- the ":" is a shorter syntax for
-- vim.opt.rtp.prepend(vim.opt.rtp, lazypath)
-- when it's caller is the first argument


-- call lazy with plugins setup in lua/plugins.lua
-- require looks for "lazy" in runtime path, finds lazy.nvim, goes to the lua/lazy directory and runs init.lua in this directory

--new config
require("lazy").setup("pluginsFolder")
