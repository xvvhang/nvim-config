local M = {}

M.config = function()
  local lspconfig = require('lspconfig')

  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local servers = {
    'cssls',
    'html',
    'jsonls',
    'tsserver',
    'lua_ls',
    -- 'vuels',
    'volar',
    'emmet_ls',
    'prismals'
  }

  local configs = {
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }
  }

  local function setup()
    for _, server in pairs(servers) do
      local config = configs[server] or {}
      config.capabilities = capabilities
      lspconfig[server].setup(config)
    end
  end

  setup()

  local map = vim.keymap.set
  map('n', '[d', vim.diagnostic.goto_prev)
  map('n', ']d', vim.diagnostic.goto_next)
  map('n', '<leader>lh', vim.lsp.buf.hover)
  map('n', '<leader>lj', vim.lsp.buf.definition)
  map('n', '<leader>lk', vim.lsp.buf.code_action)
  map('v', '<leader>lk', vim.lsp.buf.code_action)
  map('n', '<leader>ll', vim.lsp.buf.references)
  map('n', '<leader>li', vim.lsp.buf.implementation)
  map('n', '<leader>ln', vim.lsp.buf.rename)
  map('n', '<space>lm', function() vim.lsp.buf.format({ async = true }) end)

  local window = require('lspconfig.ui.windows')
  window.default_options.border = 'rounded'
  window.default_options.title = true
end

return M
