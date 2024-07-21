local keymap = vim.keymap

-- UndoTree
keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle [U]ndoTree Panel' })

-- Lazy
keymap.set('n', '<leader>l', vim.cmd.Lazy, { desc = 'Open [L]azy UI' })

-- Explore
keymap.set('n', '<leader>e', vim.cmd.Explore, { desc = 'Open File [E]xplore' })

-- Resize window using <ctrl> arrow keys
keymap.set('n', '<A-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
keymap.set('n', '<A-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
keymap.set('n', '<A-Right>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
keymap.set('n', '<A-Left>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Move Lines
keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- Live Server
keymap.set('n', '<C-l>', '<cmd>LiveServer<cr>', { desc = 'Start/Stop [L]ive Server' })

return {}
