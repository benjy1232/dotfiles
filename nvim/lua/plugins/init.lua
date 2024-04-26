return {
	{
		'folke/tokyonight.nvim',
		lazy = false,
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
	}
}
