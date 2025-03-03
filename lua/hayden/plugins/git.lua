-- Adds git gutters and git blame 
return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gs = require('gitsigns')
        gs.setup()

        vim.keymap.set("n", "<leader>gb", gs.blame, {desc = "Git: Blame File"})
        vim.keymap.set("n", "<leader>gl", gs.blame_line, {desc = "Git: Blame Line"})
    end
}
