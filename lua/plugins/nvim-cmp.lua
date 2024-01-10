local M = {}

M.opts = function()
  local cmp = require('cmp')
  local lspkind = require('lspkind')
  return {
    snippet = {
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
      end
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered()
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-l>'] = cmp.mapping.complete(),
      ['<C-c>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'copilot' },
        { name = 'nvim_lsp' },
        { name = 'vsnip' }
      },
      {
        { name = 'buffer' }
      }),
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol_text',
        preset = 'default',
        ellipsis_char = '...',
        symbol_map = { Copilot = "" }
      })
    },
    sortting = {
      priority_weight = 2
    }
  }
end

M.config = function(opts)
  local cmp = require('cmp')
  cmp.setup(opts)
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }
    }, {
      { name = 'buffer' }
    })
  })
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )
  vim.cmd [[highlight CmpItemKindCopilot guifg=#7f6ed2 guibg=NONE]]
end

return M
