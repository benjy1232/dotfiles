return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    keys = {
      {
        '<leader>ff',
        function()
          require('telescope.builtin').find_files({hidden = true})
        end,
        desc = '[F]ind [F]iles'
      },
      {
        '<leader>fg',
        function()
          require('telescope.builtin').git_files()
        end,
        desc = 'Git Files'
      },
      {
        '<leader>fb',
        function()
          require('telescope.builtin').buffers()
        end,
        desc = '[F]ind [B]uffers'
      },
      {
        '<leader>ft',
        function()
          require('telescope.builtin').help_tags()
        end,
        desc = '[F]ind Help [T]ags'
      }
    },
  },
}
