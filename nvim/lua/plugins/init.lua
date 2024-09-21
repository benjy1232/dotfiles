return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      variant = 'auto',
      dark_variant = 'main',
      dim_inactive_windows = false,
      styles = {
        transparency = false
      }
    },
    lazy = true
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    tag = 'v1.9.0',
    opts = {
      flavour = 'auto',
      background = {
        light = 'latte',
        dark = 'mocha'
      },
      transparent_background = false,
      term_colors = true,
    },
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
    opts = {
      style = "night"
    },
    lazy = true
  },
  {
    'folke/which-key.nvim'
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    tag = 'v3.0.1'
  }
}
