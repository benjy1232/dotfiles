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
        require('telescope.builtin').git_files,
        desc = 'Git Files'
      },
      {
        '<leader>pb',
        require('telescope.builtin').buffers,
        desc = '[P]roject [B]uffers'
      },
      {
        '<leader>pt',
        require('telescope.builtin').help_tags,
        desc = '[P]roject Help [T]ags'
      }
    },
    config = function()
    end
  },
}
