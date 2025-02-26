-- [[ Basic Keymaps ]]

local ls = require 'luasnip' -- Import LuaSnip

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

vim.keymap.set('n', '<leader>ek', ':e ~/.config/nvim/lua/rmapkeys.lua<CR>', { desc = '[e]dits [K]eymap.lua' })
vim.keymap.set('n', '<leader>es', ':e ~/.config/nvim/lua/snippets/tex.lua<CR>', { desc = '[e]dits [s]nipets.lua' })
vim.keymap.set({ 'i' }, '<C-s>', '<C-o>:w<CR>', { desc = 'Save' })
vim.keymap.set({ 'i' }, '<C-q>', '<C-o>:q<CR>', { desc = 'Quit' })

vim.keymap.set({ 'n' }, '<C-s>', ':w<CR>', { desc = 'Save' })
vim.keymap.set({ 'n' }, '<C-q>', ':q<CR>', { desc = 'Quit' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Jump forward with <Tab>
vim.keymap.set({ 'i', 's' }, '<Tab>', function()
  if ls.jumpable(1) then
    ls.jump(1)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
  end
end, { silent = true })

-- Jump backward with <S-Tab>
vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<S-Tab>', true, false, true), 'n', false)
  end
end, { silent = true })
