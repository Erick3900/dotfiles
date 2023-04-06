require("notify").setup({
    background_colour = "#000000"
})

require("noice").setup({
    messages = {
        enabled = false
    },
    commands = {},
    notify = {
        enabled = false
    },
    lsp = {
        progress = {
            enabled = false
        },
        hover = {
            enabled = false
        },
        signature = {
            enabled = false
        },
        message = {
            enabled = false
        }
    },
    health = {
        checker = false
    },
    smart_move = {
        enabled = false
    },
    presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = false,
        inc_rename = false,
        lsp_doc_border = false,
    },
    views = {},
    routes = {},
    status = {},
    format = {},
})
