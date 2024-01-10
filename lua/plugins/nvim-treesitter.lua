local M = {}

M.opts = {
  ensure_installed = { 'c', 'lua', 'vim' },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-n>',
      node_incremental = '[n',
      node_decremental = ']n'
    }
  },
  indent = { enable = true },
  autotag = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['as'] = '@scope'
      },
      selection_modes = {
        ['@parameter.outer'] = 'v',
        ['@function.outer'] = 'V',
        ['@class.outer'] = '<c-v>'
      },
      include_surrounding_whitespace = true,
    }
  },
}

M.config = function(opts)
  require('nvim-treesitter.configs').setup(opts)
end

return M
