local M = {}

M.keys = {
  { '<leader>t', '<CMD>BufferLinePick<CR>' },
  { '<leader>d', '<CMD>bdelete<CR>' },
  { '<leader>1', '<CMD>BufferLineGoToBuffer 1<CR>' },
  { '<leader>2', '<CMD>BufferLineGoToBuffer 2<CR>' },
  { '<leader>3', '<CMD>BufferLineGoToBuffer 3<CR>' },
  { '<leader>4', '<CMD>BufferLineGoToBuffer 4<CR>' },
  { '<leader>5', '<CMD>BufferLineGoToBuffer 5<CR>' },
  { '<leader>6', '<CMD>BufferLineGoToBuffer 6<CR>' },
  { '<leader>7', '<CMD>BufferLineGoToBuffer 7<CR>' },
  { '<leader>8', '<CMD>BufferLineGoToBuffer 8<CR>' },
  { '<leader>9', '<CMD>BufferLineGoToBuffer 9<CR>' },
}

M.opts = {
  options = {
    numbers = 'ordinal',
    show_buffer_close_icons = false,
    show_close_icon = false,
    always_show_bufferline = true,
    separator_style = { '', '' },
    hover = { enable = false },
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'Files',
        text_align = 'center',
        separator = true
      }
    }
  }
}

return M
