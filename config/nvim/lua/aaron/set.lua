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

vim.cmd("let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
vim.g.vimwiki_markdown_link_ext = 1
