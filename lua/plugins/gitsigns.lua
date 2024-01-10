local M = {}

M.opts = {
  current_line_blame = true,
  preview_config = {
    border = 'rounded'
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
    end

    -- stylua: ignore start
    map("n", "]c", gs.next_hunk, 'Next Hunk')
    map("n", "[c", gs.prev_hunk, 'Prev Hunk')
    map("n", "<leader>gp", gs.preview_hunk, 'Preview Hunk')
    map("n", "<leader>gu", gs.reset_hunk, 'Reset Hunk')
    map("n", "<leader>gd", gs.diffthis, 'Diff This')
    map("n", "<leader>gr", gs.reset_buffer, 'Reset Buffer')
    -- map("n", "<leader>gl", gs.blame_line({ full = true }), 'Blame Line')
  end,
}

return M
