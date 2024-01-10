local M = {}

M.config = function()
  local map = vim.keymap.set
  map('n', '<C-h>', require('smart-splits').resize_left)
  map('n', '<C-j>', require('smart-splits').resize_down)
  map('n', '<C-k>', require('smart-splits').resize_up)
  map('n', '<C-l>', require('smart-splits').resize_right)
end

return M
