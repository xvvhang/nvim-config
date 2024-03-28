vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 4
vim.opt.wrap = false
vim.opt.sidescrolloff = 8
vim.opt.list = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.mouse = 'a'
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false
vim.opt.confirm = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.pumheight = 10
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'indent'
vim.opt.timeoutlen = 200
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.autowrite = false
vim.opt.swapfile = false
vim.opt.wildmode = 'longest:full,full'
vim.opt.virtualedit = 'block'
vim.opt.signcolumn = 'yes'

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>nh', '<CMD>noh<CR>')
vim.keymap.set('n', '<leader>w', '<CMD>w<CR>')
vim.keymap.set('n', '<leader>c', '<C-w>c')
vim.keymap.set('n', '<C-c>', '<CMD>qa!<CR>')
vim.keymap.set('v', '<C-c>', '<CMD>qa!<CR>')
vim.keymap.set('i', '<C-c>', '<CMD>qa!<CR>')

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError', numhl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn', numhl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo', numhl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint', numhl = 'DiagnosticSignHint' })
vim.diagnostic.config({
  float = {
    border = 'rounded',
    title = ' Diagnostic ',
    title_pos = 'center'
  }
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = 'rounded',
    title = ' Hover '
  }
)
