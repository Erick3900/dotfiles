local builtin = require('telescope.builtin')

vim.keymap.set("i", "<C-f>", builtin.current_buffer_fuzzy_find, { silent = true })
vim.keymap.set("n", "<C-f>", builtin.current_buffer_fuzzy_find, { silent = true })

vim.keymap.set("i", "<C-g>", builtin.live_grep, { silent = true })
vim.keymap.set("n", "<C-g>", builtin.live_grep, { silent = true })

vim.keymap.set("i", "<C-d>", builtin.find_files, { silent = true })
vim.keymap.set("n", "<C-d>", builtin.find_files, { silent = true })

require('telescope').setup({})

