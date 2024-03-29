require('nvim-treesitter.configs').setup({
	ensure_installed = {
        "c",
        "go",
        "cpp",
        "lua",
        "vim",
        "css",
        "dot",
        "ini",
        "lua",
        "rust",
        "bash",
        "html",
        "java",
        "json",
        "make",
        "toml",
        "yaml",
        "ruby",
        "cmake",
        "latex",
        "regex",
        "python",
        "graphql",
        "c_sharp",
        "markdown",
        "dockerfile",
        "htmldjango",
        "javascript",
        "typescript",
        "javascript",
    },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
        use_languagetree = true,
		additional_vim_regex_highlighting = false
	},
    indent =  {
        enable = true
    }
})
