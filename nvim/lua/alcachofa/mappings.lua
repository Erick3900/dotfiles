vim.keymap.set("i", "<C-s>", "<Esc>:w<cr>a", { silent = true })
vim.keymap.set("n", "<C-s>", ":w<cr>", { silent = true })

vim.keymap.set("i", "<S-Up>", "<Esc>:m -2<cr>a", { silent = true })
vim.keymap.set("n", "<S-Up>", ":m -2<cr>", { silent = true })

vim.keymap.set("i", "<S-Down>", "<Esc>:m +1<cr>a", { silent = true })
vim.keymap.set("n", "<S-Down>", ":m +1<cr>", { silent = true })

vim.keymap.set("n", "<A-d>", "\"_d", { silent = true })
vim.keymap.set("v", "<A-d>", "\"_d", { silent = true })

vim.keymap.set("n", "x", "v<A-d>", { silent = true, remap = true })

vim.keymap.set("i", "<A-l>", "<Right>", { silent = true, remap = true })
vim.keymap.set("i", "<A-h>", "<Left>", { silent = true, remap = true })
vim.keymap.set("i", "<A-j>", "<Down>", { silent = true, remap = true })
vim.keymap.set("i", "<A-k>", "<Up>", { silent = true, remap = true })
