local opt = vim.opt

opt.relativenumber = true
opt.cursorline = true
opt.wrap = false

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

vim.cmd [[
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
]]

-- Allows for pasting from clipboard
opt.clipboard:append("unnamedplus")
opt.backspace = "indent,eol,start"

-- Improves searches to only care about case when you search 
-- with uppercase letters
opt.ignorecase = true
opt.smartcase = true
