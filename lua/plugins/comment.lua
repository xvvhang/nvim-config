local M = {}

M.opts = function()
  local ts = require('ts_context_commentstring.integrations.comment_nvim')
  return {
    toggler = {
      line = '<leader>bb',
      block = '<leader>bn'
    },
    opleader = {
      line = '<leader>bb',
      block = '<leader>bn'
    },
    mappings = {
      basic = true,
      extra = false
    },
    pre_hook = ts.create_pre_hook()
  }
end

return M
