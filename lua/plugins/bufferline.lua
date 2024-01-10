local M = {}

M.keys = {
  { '<leader>k', '<cmd>BufferLinePick<CR>' },
  { '<leader>p', '<cmd>BufferLineTogglePin<CR>' },
  { '<leader>d', '<cmd>bdelete<CR>' }
}

M.opts = {
  options = {
    numbers = 'ordinal',
    show_buffer_close_icons = false,
    show_close_icon = false,
    always_show_bufferline = true,
    separator_style = { '', '' },
    hover = { enable = false }
  }
}

return M
