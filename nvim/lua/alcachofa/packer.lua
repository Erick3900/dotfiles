vim.cmd.packadd("packer.nvim")

return require('packer').startup(function (use)
	use('wbthomason/packer.nvim')

	-- Themes
	use('EdenEast/nightfox.nvim')

	-- Syntax Highlighting
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	-- Utils
	use({
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = false }
	})
	use({
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	})
	use('preservim/nerdtree')
    use('neoclide/coc.nvim')
    use('jiangmiao/auto-pairs')
    use('preservim/nerdcommenter')
    use('ryanoasis/vim-devicons')
    use('airblade/vim-gitgutter')
    use('junegunn/fzf')
    use('junegunn/fzf.vim')
    use('voldikss/vim-floaterm')
    use('startup-nvim/startup.nvim')
    use('fannheyward/telescope-coc.nvim')
end)
