local M = {}

M.keys = {
  { '<leader>kj', '<CMD>CopilotChatToggle' },
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
  return {
    -- proxy = 'https://127.0.0.1:7890'
  }
end

M.config = function(opts)
  local chat = require('CopilotChat')
  chat.setup(opts)
end

return M
