-- [[ Basic Keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Tab keymaps
vim.keymap.set('n', '<S-Tab>', 'gT', { desc = 'Moves to the previous tab' })
vim.keymap.set('n', '<tab>', 'gt', { desc = 'Moves to the next tab' })
vim.keymap.set('n', '<leader>nt', ':tabnew<CR>', { desc = 'Open a [N]ew [T]ab' })
-- Edit keymaps
vim.keymap.set('n', '<leader>ei', ':e ~/.config/nvim/init.lua<CR>', { desc = '[e]dits [i]nit.lua' })
vim.keymap.set('n', '<leader>es', ':e ~/.config/nvim/lua/snippets.lua<CR>', { desc = '[e]dits [s]nipets.lua' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<C-q>', ':q<CR>', { desc = 'Exit' })
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
