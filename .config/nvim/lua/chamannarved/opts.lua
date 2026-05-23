vim.g.netrw_banner = 0

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.inccommand = 'split'

vim.opt.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus'

vim.opt.scrolloff = 4

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 3

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath 'data' .. '/undodir'
vim.opt.undofile = true

vim.opt.completeopt = 'menuone,noselect,fuzzy,nosort'
vim.opt.shortmess:append 'c'
vim.opt.isfname:append '@-@'

vim.opt.signcolumn = 'yes'

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- FC is supposed to be the windows' diff equivalent
local os_info = vim.loop.os_uname()
if os_info.sysname == 'Windows_NT' then
  vim.g.undotree_DiffCommand = 'FC'
end
