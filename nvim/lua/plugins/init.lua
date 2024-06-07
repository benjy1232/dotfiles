return {
	{
		'folke/tokyonight.nvim',
		lazy = true,
		priority = 1000,
		config = {
			style = 'night',
			transparent = true,
			styles = {
				comments = { italic = false },
				keywords = { italic = false }
			}
		}
	},
	{
		'nvim-lualine/lualine.nvim',
		dependecies = { 'nvim-tree/nvim-web-devicons' },
		opts = {}
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate'
	},
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		lazy = false
	}
}
