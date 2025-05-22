vim.cmd("set nocompatible")
vim.cmd(":filetype plugin on")
vim.cmd("syntax on")

local opt = vim.opt

opt.background = "dark"
opt.termguicolors = true
opt.number = true
opt.laststatus = 2
opt.showmode = false
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.cursorline = true
opt.colorcolumn = "80"
opt.relativenumber = true
opt.paste = true
opt.showmatch = true
opt.swapfile = false
opt.backup = false
opt.guicursor = ""
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.wrap = false
opt.scrolloff = 8
opt.updatetime = 50
opt.ttimeoutlen = 0
opt.fillchars = {eob = " "}
opt.mouse = ""
opt.tabstop = 2
opt.softtabstop = 0

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

-- Remove trailing whitespaces on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" }, -- Apply to all file types
  command = [[%s/\s\+$//e]],
})

-- Leader
vim.g.mapleader = "\\"
vim.g.maplocalleader = " "

-- Stop netrw because neo-tree refuses to do so.
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Previous buffer shortcut
vim.keymap.set("n", "<leader>]", ":bp<CR>")
vim.keymap.set("n", "<leader>[", ":bn<CR>")

-- Setup lazy.nvim
require("lazy").setup("plugins")

-- Show neo-tree on startup, because, again, it refuses to do so itself.
vim.cmd("set noshowcmd")
vim.cmd(":Neotree filesystem reveal left")
