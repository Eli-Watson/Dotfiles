--                       _
-- _ __   ___  _____   _(_)_ __ ___
--| '_ \ / _ \/ _ \ \ / / | '_ ` _ \
--| | | |  __/ (_) \ V /| | | | | | |
--|_| |_|\___|\___/ \_/ |_|_| |_| |_|
-- Eli Watson's Nvim config
-- uses lazy for loading plugins, they are all in their own lua file under /plugins/

-- Normal vim stuff
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.opt.number = true
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"



-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")





