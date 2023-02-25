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
