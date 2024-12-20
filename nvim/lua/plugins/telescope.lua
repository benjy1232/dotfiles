return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    keys = {
      {
        '<leader>pf',
        function()
          require('telescope.builtin').find_files({hidden = true})
        end,
        desc = '[P]roject [F]iles'
      },
      {
        '<C-p>',
        function()
          require('telescope.builtin').git_files()
        end,
        desc = 'Git Files'
      },
      {
        '<leader>pb',
        function()
          require('telescope.builtin').buffers()
        end,
        desc = '[P]roject [B]uffers'
      },
      {
        '<leader>pt',
        function()
          require('telescope.builtin').help_tags()
        end,
        desc = '[P]roject Help [T]ags'
      }
    },
  },
}
