vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus'
vim.opt.expandtab = true
vim.opt.scrolloff = 4
vim.opt.undofile = true

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- FC is supposed to be the windows' diff equivalent
local os_info = vim.loop.os_uname()
if os_info.sysname == 'Windows_NT' then
    vim.g.undotree_DiffCommand = 'FC'
end
