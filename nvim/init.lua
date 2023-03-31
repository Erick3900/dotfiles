-- vim.opt.runtimepath:append("~/.config/nvim/syntax")

vim.opt.syntax = 'on'

vim.opt.updatetime = 300
vim.opt.guicursor = { "n-v-c-sm-i-ci-ve:block", "r-cr-o:hor20" }

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.relativenumber = true

vim.opt.ruler = true
vim.opt.visualbell = true
vim.opt.encoding = "UTF-8"

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.mouse = "a"

vim.o.wrap = false

vim.o.backup = false
vim.o.writebackup = false

vim.opt.cmdheight = 1
vim.opt.shortmess:append({ n = true })

vim.opt.signcolumn = "yes"

vim.opt.clipboard = "unnamedplus"

vim.opt.laststatus = 2

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.o.expandtab = true

require("alcachofa")

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.fillchars:append({ eob = ' ' })

