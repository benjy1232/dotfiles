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
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require('lspconfig')
			-- Lua LSP Setup - Primarily for Neovim
			lspconfig.lua_ls.setup {
				cmd = {'/opt/lua-language-server/bin/lua-language-server'},
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
			  capabilities = capabilities
			}

			-- Clangd setup
			lspconfig.clangd.setup {
				capabilities = capabilities
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
				capabilities = capabilities
			}

			-- Python
			lspconfig.pylsp.setup {
				capabilities = capabilities
			}
		end
	},
	{
		'folke/trouble.nvim',
		config = function()
			require("trouble").setup({
				icons = false,
			})

			vim.keymap.set("n", "<leader>tt", function()
				require("trouble").toggle()
			end)

			vim.keymap.set("n", "[t", function()
				require("trouble").next({skip_groups = true, jump = true});
			end)

			vim.keymap.set("n", "]t", function()
				require("trouble").previous({skip_groups = true, jump = true});
			end)
		end
	}
}
