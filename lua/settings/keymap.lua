local opts = { noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

-- Set leader key to <space>
keymap('', '<space>', '<nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Navigate between windows
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)

-- Navigate between tabs
keymap('n', 'H', 'gT', opts)
keymap('n', 'L', 'gt', opts)

-- Resize windows with arrow keys
keymap('n', '<c-up>', ':resize +2<cr>', opts)
keymap('n', '<c-down>', ':resize -2<cr>', opts)
keymap('n', '<c-right>', ':vertical resize +2<cr>', opts)
keymap('n', '<c-left>', ':vertical resize -2<cr>', opts)

-- Easy escape from insert mode
keymap('i', 'jj', '<esc>', opts)

-- Move text
keymap('v', '>', '>gv', opts)
keymap('v', '<', '<gv', opts)

keymap('x', '>', '>gv', opts)
keymap('x', '<', '<gv', opts)

keymap('v', '<a-j>', ':m .+1<cr>==', opts)
keymap('v', '<a-k>', ':m .-2<cr>==', opts)

-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap('x', '<a-j>', ":move '>+1<CR>gv-gv", opts)
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

-- Visual paste
keymap('v', 'p', '"_dP', opts)
keymap('x', 'p', '"_dP', opts)

-- Blackhole delete
keymap('n', '<leader>d', '"_d', opts)
keymap('x', '<leader>d', '"_d', opts)
keymap('v', '<leader>d', '"_d', opts)
keymap('n', '<leader>x', '"_x', opts)
keymap('x', '<leader>x', '"_x', opts)
keymap('v', '<leader>x', '"_x', opts)
