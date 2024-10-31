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
    tag = 'v1.0.0',
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')
      -- Lua LSP Setup - Primarily for Neovim
      lspconfig.lua_ls.setup {
        cmd = {'/opt/lua-language-server/bin/lua-language-server'},
        on_attach = on_attach,
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
            return
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
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
        -- capabilities = capabilities
      }

      -- Clangd setup
      lspconfig.clangd.setup {
        capabilities = capabilities,
        on_attach = on_attach
      }

      -- Gopls setup
      lspconfig.gopls.setup {
        capabilities = capabilities
      }

      -- OCaml
      lspconfig.ocamllsp.setup {
        capabilities = capabilities
      }

      -- Rust
      lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        on_attach = on_attach
      }

      -- Python
      lspconfig.pylsp.setup {
        capabilities = capabilities
      }

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
        '<leader>tt',
        function() require('trouble').toggle('diagnostics') end,
        desc = '[T]oggle [T]rouble Diagnostics'
      },
      {
        '[t',
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
        ']t',
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
