local toggle_inlay_hint = function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

local on_attach = function(client, bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  nmap('K', vim.lsp.buf.hover, 'Hover')
  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gt', vim.lsp.buf.type_definition, '[G]oto [T]ype definition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

  if client.supports_method('textDocument/implementation') then
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  end

  if client.supports_method('textDocument/inlayHint') then
    vim.lsp.inlay_hint.enable(true)
    nmap('<leader>th', toggle_inlay_hint, '[T]oggle [H]int')
  end
end

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip'
    },
    tag = 'v2.3.0',
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Lua LSP Setup - Primarily for Neovim
      vim.lsp.enable('lua_ls')
      vim.lsp.config('lua_ls', {
        on_attach = on_attach,
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
              path ~= vim.fn.stdpath('config')
              and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT'
            },
            -- Tell the language server how to find Lua modules same way as Neovim
            path = {
              'lua/?.lua',
              'lua/?/init.lua'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
                -- Depending on the usage, you might want to add additional paths here.
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              }
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
              -- library = vim.api.nvim_get_runtime_file("", true)
            }
          })
        end,
        settings = {
          Lua = {}
        },
        capabilities = capabilities,
      })

      -- Clangd setup
      vim.lsp.enable('clangd')
      vim.lsp.config('clangd', {
        capabilities = capabilities,
        on_attach = on_attach
      })

      -- Gopls setup
      vim.lsp.enable('gopls')
      vim.lsp.config('gopls', {
        capabilities = capabilities,
        on_attach = on_attach
      })

      -- OCaml
      vim.lsp.enable('ocamllsp')
      vim.lsp.config('ocamllsp', {
        capabilities = capabilities,
        on_attach = on_attach
      })

      -- Rust
      vim.lsp.enable('rust_analyzer')
      vim.lsp.config('rust_analyzer', {
        capabilities = capabilities,
        on_attach = on_attach
      })

      -- Python
      vim.lsp.enable('pylsp')
      vim.lsp.config('pylsp', {
        capabilities = capabilities,
        on_attach = on_attach
      })
    end
  },
  {
    'folke/trouble.nvim',
    tag = 'v3.6.0',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    keys = {
      {
        '<leader>xx',
        function() require('trouble').toggle('diagnostics') end,
        desc = 'Toggle Trouble Diagnostics'
      },
      {
        '[x',
        function()
          require('trouble').prev({
            mode = 'diagnostics',
            focus = false,
            jump = true
           })
        end,
        desc = 'Previous Issue'
      },
      {
        ']x',
        function()
          require('trouble').next({
            mode = 'diagnostics',
            focus = false,
            jump = true
          })
        end,
        desc = 'Next Issue'
      }
    },
    opts = {},
  }
}
