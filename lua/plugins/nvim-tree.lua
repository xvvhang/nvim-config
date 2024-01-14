local M = {}

M.keys = {
  { '<leader>e', '<CMD>NvimTreeToggle<CR>' },
  { '<ESC>', '<CMD>NvimTreeClose<CR>' }
}

M.opts = {
  hijack_cursor = true,
  view = {
    float = {
      enable = true,
      quit_on_focus_loss = false,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * 0.5
        local window_h = screen_h * 0.8
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
        return {
          title = ' Files ',
          title_pos = 'center',
          border = 'rounded',
          relative = 'editor',
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
      end,
    }
  },
  renderer = {
    special_files = { 'package.json', 'package-lock.json', 'yarn.lock', 'README.md', 'readme.md' },
    highlight_git = true,
    highlight_modified = 'name',
    indent_markers = { enable = true },
    icons = {
      git_placement = 'signcolumn',
      modified_placement = 'before',
      show = { folder_arrow = false },
      glyphs = {
        git = {
          unstaged = '',
          staged = '',
          unmerged = '',
          renamed = '󰁕',
          untracked = '',
          deleted = '✖',
          ignored = '󱥸'
        }
      }
    }
  },
  modified = { enable = true },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  },
  ui = {
    confirm = {
      remove = false,
      trash = false
    }
  }
}

return M
