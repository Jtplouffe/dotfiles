local nvimtree = require("nvim-tree")
local api = require("nvim-tree.api")

nvimtree.setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    disable_netrw = true,
    hijack_netrw = true,
    update_focused_file = {
        enable = true,
        update_root = true
    }
})

local function open_nvim_tree(data)
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    api.tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
