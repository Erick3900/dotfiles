local c = {}

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
            },
            Normal = {
                bg = "none",
                ctermbg = "none"
            },
            NormalFloat = {
                bg = "none",
                ctermbg = "none"
            }
        }
    }
})

-- Nightfox Theme
vim.cmd.colorscheme("duskfox")
