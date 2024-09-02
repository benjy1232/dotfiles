return {
	{
		'rose-pine/neovim',
		lazy = true,
		name = 'rose-pine',
		opts = {
			variant = 'auto',
			dark_variant = 'main',
			dim_inactive_windows = false,
			styles = {
				transparency = false
			}
		}
	},
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		opts = {
			flavour = 'auto',
			background = {
				light = 'latte',
				dark = 'mocha'
			},
			transparent_background = false,
			term_colors = true,
		}
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				icons_enabled = true,
				theme = 'auto'
			}
		}
	},
	{
		'folke/tokyonight.nvim',
		lazy = true
	}
}
