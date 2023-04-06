-- require('nightfox').setup({
--     options = {
--         transparent = true,
--         styles = {
--             comments = "italic",
--             keywords = "bold",
--         },
--         inverse = {
--             match_paren = true,
--         },
--     },
--     groups = {
--         all = {
--             Conceal = {
--                 fg = "palette.comment"
--             },
--             Normal = {
--                 bg = "none",
--                 ctermbg = "none"
--             },
--             NormalFloat = {
--                 bg = "none",
--                 ctermbg = "none"
--             }
--         }
--     }
-- })

-- -- Nightfox Theme
-- vim.cmd.colorscheme("duskfox")

require("gruvbox").setup({
    overrides = {
        Normal = {
            bg = "none",
            ctermbg = "none"
        },
        NormalFloat = {
            bg = "none",
            ctermbg = "none"
        }
    },
    transparent_mode = true,
})

vim.cmd("colorscheme gruvbox")

