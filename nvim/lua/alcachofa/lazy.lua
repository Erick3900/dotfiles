local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        "rebelot/kanagawa.nvim",
        "EdenEast/nightfox.nvim",
        "sainnhe/gruvbox-material",
        "loctvl842/monokai-pro.nvim",
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                local configs = require("nvim-treesitter.configs")

                configs.setup({
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
                    highlight = {
                        enable = true,
                        use_languagetree = true,
                        additional_vim_regex_highlighting = false
                    },
                    indent = {
                        enable = true
                    },
                })
            end
        },
        "junegunn/fzf",
        "mbbill/undotree",
        "tpope/vim-fugitive",
        "windwp/nvim-autopairs",
        "voldikss/vim-floaterm",
        "nvim-lua/plenary.nvim",
        "airblade/vim-gitgutter",
        "preservim/nerdcommenter",
        "NvChad/nvim-colorizer.lua",
        "startup-nvim/startup.nvim",
        "christoomey/vim-tmux-navigator",
        "lukas-reineke/indent-blankline.nvim",
        {
            "nvim-lualine/lualine.nvim",
            dependencies = {
                "nvim-tree/nvim-web-devicons"
            }
        },
        {
            "ggandor/leap.nvim",
            dependencies = {
                "tpope/vim-repeat"
            }
        },
        {
            "nvim-tree/nvim-tree.lua",
            dependencies = {
                "nvim-tree/nvim-web-devicons"
            }
        },
        {
            "akinsho/bufferline.nvim",
            dependencies = {
                "nvim-tree/nvim-web-devicons"
            }
        },
        {
            "nvim-telescope/telescope.nvim",
            version = "0.1.x",
            dependencies = {
                "nvim-lua/plenary.nvim"
            }
        },
        {
            "erick3900/arti.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope.nvim"
            },
            opts = {
                ws = {
                    enabled = true
                }
            }
        },
        {
            "folke/noice.nvim",
            dependencies = {
                "MunifTanjim/nui.nvim",
                "rcarriga/nvim-notify",
            }
        },
        {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v2.x",
            dependencies = {
                "neovim/nvim-lspconfig",
                {
                    "williamboman/mason.nvim",
                    build = ":MasonUpdate"
                },
                "williamboman/mason-lspconfig.nvim",
                "hrsh7th/nvim-cmp",
                "hrsh7th/cmp-nvim-lsp",
                "L3MON4D3/LuaSnip",
                "p00f/clangd_extensions.nvim",
                "onsails/lspkind.nvim"
            }
        },
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim"
    },
    {}
)