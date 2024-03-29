local M = {}

local find_files = function()
  require('nvim-tree.api').tree.close()
  require('telescope.builtin').find_files()
end

local live_grep = function()
  require('nvim-tree.api').tree.close()
  require('telescope.builtin').live_grep()
end

M.keys = {
  { '<leader>f', find_files },
  { '<leader>j', live_grep },
}

M.opts = {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      width = 0.5
   }
  }
}

return M
