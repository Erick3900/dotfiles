vim.g.NERDCreateDefaultMappings = 0
vim.g.NERDSpaceDelims = 1
vim.g.NERDCompactSexyComs = 1
vim.g.NERDDefaultAlign = "left"

vim.keymap.set("i", "<C-k>", "<Esc><plug>NERDCommenterToggle i", { silent = true })
vim.keymap.set("n", "<C-k>", "<plug>NERDCommenterToggle", { silent = true })
vim.keymap.set("v", "<C-k>", "<plug>NERDCommenterToggle", { silent = true })
