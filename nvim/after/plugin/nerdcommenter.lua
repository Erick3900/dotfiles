vim.g.NERDCreateDefaultMappings = 0
vim.g.NERDSpaceDelims = 1
vim.g.NERDCompactSexyComs = 1
vim.g.NERDDefaultAlign = "left"

vim.keymap.set("i", "<C-t>", "<Esc><plug>NERDCommenterToggle i", { silent = true, remap = true })
vim.keymap.set("n", "<C-t>", "<plug>NERDCommenterToggle", { silent = true, remap = true })
vim.keymap.set("v", "<C-t>", "<plug>NERDCommenterToggle", { silent = true, remap = true })
