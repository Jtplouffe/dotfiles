local telescope = require("telescope")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

telescope.setup({
    pickers = {
        buffers = {
            ignore_current_buffer = true,
            sort_lastused = true
        }
    }
})

telescope.load_extension("projects")
vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>")
