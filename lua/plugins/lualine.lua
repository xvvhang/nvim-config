local M = {}

local lsp_clients = function()
  local buffer = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.buf_get_clients(buffer)
  local names = {}
  for _, client in pairs(clients) do
    if client.name ~= 'copilot' then
      table.insert(names, client.name)
    end
  end
  return table.concat(names, ',')
end

local copilot_status = function()
  local status = ''
  local api = require('copilot.api')
  api.register_status_notification_handler(function(data)
    if data.status == 'Normal' then
      status = 'Ready'
    elseif data.status == 'InProgress' then
      status = 'Pending'
    else
      status = data.status or 'Offline'
    end
  end)
  return status
end

M.opts = {
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    globalstatus = false
  },
  sections = {
    lualine_a = {
      'mode',
      {
        'progress',
        padding = { left = 0, right = 1 }
      }
    },
    lualine_b = {
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' ',
        }
      }
    },
    lualine_c = {
      {
        'filesize',
        color = { gui = 'italic' }
      },
      {
        'filename',
        file_status = true,
        path = 1,
        symbols = {
          modified = '',
          readonly = '',
          unnamed = '[No Name]',
          newfile = '[New File]'
        },
        color = { gui = 'italic' }
      }
    },
    lualine_x = {
      {
        'lsp_progress',
        timer = { progress_enddelay = 100, spinner = 100, lsp_client_name_enddelay = 100 },
        spinner_symbols = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
        color = { gui = 'italic' }
      }
    },
    lualine_y = {
      'branch',
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' },
      }
    },
    lualine_z = {
      { lsp_clients, icon = ' LSP:' },
      { copilot_status, icon = ' Copilot:' }
    }
  },
  extensions = { 'quickfix', 'lazy', 'nvim-tree' }
}

return M
