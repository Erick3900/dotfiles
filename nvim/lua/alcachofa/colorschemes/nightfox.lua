return {
    options = {
        transparent = true,
        styles = {
            keywords = "bold",
            comments = "italic",
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
            },
            FloatBorder = {
                bg = "none",
                ctermbg = "none"
            },
            FloatTitle = {
                bg = "none",
                ctermbg = "none"
            },
            TelescopeTitle = {
                fg = "palette.pink.bright",
                bg = "palette.bg2",
            },
            TelescopePromptNormal = {
                bg = "palette.bg3",
            },
            TelescopePromptBorder = {
                fg = "palette.bg3",
                bg = "none",
            },
            TelescopeResultsNormal = {
                bg = "palette.bg2",
            },
            TelescopeResultsBorder = {
                fg = "palette.bg2",
                bg = "none",
            },
            TelescopePreviewNormal = {
                bg = "palette.bg1",
            },
            TelescopePreviewBorder = {
                fg = "palette.bg1",
                bg = "none",
            },
        }
    }
}
