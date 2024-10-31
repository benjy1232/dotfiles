return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    tag = 'v3.0.1',
    opts = {
      variant = 'auto',
      dark_variant = 'main',
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
      term_colors = true,
    },
    lazy = true
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
      style = "night",
    },
    lazy = true
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = true,
    opts = {
      theme = 'wave',
      background = {
        dark = 'wave',
        light = 'lotus'
      },
    }
  },
  {
    'navarasu/onedark.nvim',
    lazy = true,
    opts = {
      style = 'darker'
    }
  }
}