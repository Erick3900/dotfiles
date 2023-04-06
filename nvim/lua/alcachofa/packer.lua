vim.cmd.packadd("packer.nvim")

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')

    -- Themes
    use('EdenEast/nightfox.nvim')
    use('ellisonleao/gruvbox.nvim')
    use('lmburns/kimbox')

    -- Syntax Highlighting
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- Utils
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = false }
    })
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })
    use('preservim/nerdtree')
    use('jiangmiao/auto-pairs')
    use('preservim/nerdcommenter')
    use('ryanoasis/vim-devicons')
    use('airblade/vim-gitgutter')
    use('junegunn/fzf')
    use('junegunn/fzf.vim')
    use('voldikss/vim-floaterm')
    use('startup-nvim/startup.nvim')
    use('folke/zen-mode.nvim')

    use {
        "Dax89/automaton.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" }
        }
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
            { 'p00f/clangd_extensions.nvim' },
            { 'onsails/lspkind.nvim' }
        }
    }

    use {
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    }
end)
