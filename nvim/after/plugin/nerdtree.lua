vim.g.NERDTreeShowHidden = 0
vim.g.NERDTreeQuitOnOpen = 0
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeDirArrows = 1
vim.g.NERDTreeMapOpenInTab = "\t"
vim.g.NERDTreeLimitedSyntax = 0
vim.g.NERDTreeHighlightCursorline = 0

vim.keymap.set("i", "<C-b>", "<Esc>:NERDTreeToggle<cr>", { silent = true })
vim.keymap.set("n", "<C-b>", ":NERDTreeToggle<cr>", { silent = true })
