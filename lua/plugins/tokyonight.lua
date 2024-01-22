local M = {}

M.config = function()
  local tokyonight = require('tokyonight')
  tokyonight.setup({
    style = 'night',
    dim_inactive = true,
  })
  vim.cmd[[colorscheme tokyonight]]
end

return M
