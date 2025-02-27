-- Set leader key (if not already set)
vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Split screen mappings
keymap("n", "<leader>|", ":vsplit<CR>", opts) -- Vertical split
keymap("n", "<leader>-", ":split<CR>", opts)  -- Horizontal split

-- Pane navigation mappings with Ctrl
keymap("n", "<C-h>", "<C-w>h", opts) -- Move left
keymap("n", "<C-j>", "<C-w>j", opts) -- Move down
keymap("n", "<C-k>", "<C-w>k", opts) -- Move up
keymap("n", "<C-l>", "<C-w>l", opts) -- Move right

