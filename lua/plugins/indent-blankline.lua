local M = {}

M.opts = {
  indent = {
    char = '│',
    tab_char = '│'
  },
  scope = { enabled = true },
  exclude = {
    filetypes = {
      'help',
      'nvim-tree',
      'mason',
    }
  }
}

return M
