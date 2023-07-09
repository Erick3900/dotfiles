vim.opt.termguicolors = true

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#44475A gui=nocombine]]

vim.opt.list = true

vim.opt.listchars:append "space: "

require("indent_blankline").setup {
    indentLine_enabled = 1,
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
}
