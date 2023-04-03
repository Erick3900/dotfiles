require('nightfox').setup({
    options = {
        transparent = true,
        styles = {
            comments = "italic",
            keywords = "bold",
        },
        inverse = {
            match_paren = true,
        },
    },
    groups = {
        all = {
            Conceal = {
                fg = "palette.comment"
            }
        }
    }
})

-- Nightfox Theme
vim.cmd.colorscheme("duskfox")

vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })
