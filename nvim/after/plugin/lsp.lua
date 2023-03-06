local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "lua_ls",
    "rust_analyzer"
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping(function(fallback)
        if not cmp.visible() then
            fallback()
            return
        end

        local entry = cmp.get_selected_entry()
        if not entry then
            cmp.select_next_item(cmp_select)
            return
        end

        cmp.confirm()
    end, { "i", "s", "c" })
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    experimental = {
        ghost_text = true
    }
})

local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts) -- Go to definition
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts) -- Go to references
    vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts) -- Hover

    vim.keymap.set("n", "<leader>cs", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>cd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, opts) -- Format
    vim.keymap.set("v", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, opts) -- Format
end

lsp.on_attach(on_attach)

lsp.setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        update_in_insert = true
    }
)

vim.diagnostic.config({
    virtual_text = true
})

local signature = require("lsp_signature")
signature.setup({
    wrap = false,
    hint_enable = false
})

local lspconfig = require("lspconfig")
lspconfig.dartls.setup({
    on_attach = on_attach
})
