return {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }},
    config = function()
        vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files, {desc = "Telescope: find_files"})
        vim.keymap.set("n", "<space>fw", require('telescope.builtin').live_grep, {desc = "Telescope: live_grep"})
        vim.keymap.set("n", "<space>fj", require('telescope.builtin').jumplist, {desc = "Telescope: jumplist"})
    end
}
