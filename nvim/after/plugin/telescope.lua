local telescope = require("telescope")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>tf", builtin.find_files, {})
vim.keymap.set("n", "<leader>tg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>tb", builtin.buffers, {})
vim.keymap.set("n", "<leader>td", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>tp", ":Telescope projects<CR>")

telescope.setup({
    pickers = {
        buffers = {
            ignore_current_buffer = true,
            sort_lastused = true
        }
    }
})

telescope.load_extension("projects")
