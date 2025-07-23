return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = function()
      require('mason').setup {
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
        registries = {
          'github:Crashdummyy/mason-registry',
          'github:mason-org/mason-registry',
        },
      }
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      local mason_lspconfig = require 'mason-lspconfig'
      local lspconfig = require 'lspconfig'
      local cmp_nvim_lsp = require 'cmp_nvim_lsp'
      local capabilities = cmp_nvim_lsp.default_capabilities()

      mason_lspconfig.setup {
        ensure_installed = {
          'lua_ls',
          'html',
          'cssls',
          'tailwindcss',
          'gopls',
          'emmet_ls',
          'emmet_language_server',
          'marksman',
        },
        automatic_installation = true,
        -- Handler movido para dentro do setup
        handlers = {
          -- handler padrão para todos
          function(server_name)
            lspconfig[server_name].setup { capabilities = capabilities }
          end,
          ['emmet_ls'] = function()
            lspconfig.emmet_ls.setup {
              capabilities = capabilities,
              filetypes = {
                'html',
                'typescriptreact',
                'javascriptreact',
                'css',
                'sass',
                'scss',
                'less',
                'svelte',
              },
            }
          end,
          ['lua_ls'] = function()
            lspconfig.lua_ls.setup {
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = { globals = { 'vim' } },
                  completion = { callSnippet = 'Replace' },
                  workspace = {
                    library = {
                      [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                      [vim.fn.stdpath 'config' .. '/lua'] = true,
                    },
                  },
                },
              },
            }
          end,
          ['emmet_language_server'] = function()
            lspconfig.emmet_language_server.setup {
              filetypes = {
                'css',
                'eruby',
                'html',
                'javascript',
                'javascriptreact',
                'less',
                'sass',
                'scss',
                'pug',
                'typescriptreact',
              },
              init_options = {
                includeLanguages = {},
                excludeLanguages = {},
                extensionsPath = {},
                preferences = {},
                showAbbreviationSuggestions = true,
                showExpandedAbbreviation = 'always',
                showSuggestionsAsSnippets = false,
                syntaxProfiles = {},
                variables = {},
              },
            }
          end,
          ['denols'] = function()
            lspconfig.denols.setup {
              capabilities = capabilities,
              root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
            }
          end,
          ['ts_ls'] = function()
            lspconfig.ts_ls.setup {
              capabilities = capabilities,
              root_dir = function(fname)
                local util = lspconfig.util
                return not util.root_pattern('deno.json', 'deno.jsonc')(fname)
                  and util.root_pattern('tsconfig.json', 'package.json', 'jsconfig.json', '.git')(fname)
              end,
              single_file_support = false,
              init_options = {
                preferences = {
                  includeCompletionsWithSnippetText = true,
                  includeCompletionsForImportStatements = true,
                },
              },
            }
          end,
        },
      }
    end,
  },

  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require('mason-tool-installer').setup {
        ensure_installed = {
          'prettier',
          'stylua',
          'isort',
          'pylint',
          'clangd',
          'denols',
          { 'eslint_d', version = '13.1.2' },
        },
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    dependencies = { 'neovim/nvim-lspconfig' },
  },
}
