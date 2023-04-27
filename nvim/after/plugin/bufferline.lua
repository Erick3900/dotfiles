require("bufferline").setup({
    options = {
        modified_icon = '',
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = false
            }
        },
        separator_style = "thin",
        always_show_bufferline = true
    }
})

vim.keymap.set("n", "<C-x>", ":bd<CR>", { silent = true, remap = true })
vim.keymap.set("n", "<leader><Tab>", ":BufferLineCycleNext<CR>", { silent = true, remap = true })
vim.keymap.set("n", "<leader><S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true, remap = true })
vim.keymap.set("n", "<leader>tt", ":BufferLinePick<CR>", { silent = true, remap = true })
