local builtin = require('telescope.builtin')
local theme = require('telescope.themes').get_dropdown()

vim.keymap.set("i", "<C-f>", function() builtin.current_buffer_fuzzy_find(theme) end, { silent = true })
vim.keymap.set("n", "<C-f>", function() builtin.current_buffer_fuzzy_find(theme) end, { silent = true })

vim.keymap.set("i", "<C-g>", function() builtin.live_grep(theme) end, { silent = true })
vim.keymap.set("n", "<C-g>", function() builtin.live_grep(theme) end, { silent = true })

vim.keymap.set("i", "<C-d>", function() builtin.find_files(theme) end, { silent = true })
vim.keymap.set("n", "<C-d>", function() builtin.find_files(theme) end, { silent = true })

require('telescope').setup()

