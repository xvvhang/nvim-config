local M = {}

M.keys = {
  { '<leader>kk', '<CMD>CopilotChatToggle<CR>' },
  { '<leader>ke', '<CMD>CopilotChatExplain<CR>', mode = 'v' },
  { '<leader>kt', '<CMD>CopilotChatTests<CR>', mode = 'v' },
  { '<leader>kf', '<CMD>CopilotChatFix<CR>', mode = 'v' },
  { '<leader>ko', '<CMD>CopilotChatOptimize<CR>', mode = 'v' },
  { '<leader>kd', '<CMD>CopilotChatDocs<CR>', mode = 'v' },
  {
    "<leader>kj",
    function()
      local input = vim.fn.input("Quick Chat: ")
      if input ~= "" then
        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
      end
    end,
    desc = "CopilotChat - Quick chat",
  }
}


M.opts = function()
  local screen_w = vim.opt.columns:get()
  local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
  local window_w = screen_w * 0.5
  local window_h = screen_h * 0.8
  local window_w_int = math.floor(window_w)
  local window_h_int = math.floor(window_h)

  return {
    -- proxy = 'https://127.0.0.1:7890'
    separator = '::',
    show_help = false,
    mappings = {
      reset = {
        normal ='<C-r>',
        insert = '<C-r>'
      }
    },
    window = {
      layout = 'float',
      width = window_w_int,
      height = window_h_int,
      border = 'rounded',
    }
  }
end

M.config = function(opts)
  local chat = require('CopilotChat')
  chat.setup(opts)
end

return M
