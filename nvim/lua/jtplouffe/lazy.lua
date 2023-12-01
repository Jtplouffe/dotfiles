-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make'
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true
	},
	{ "nvim-treesitter/nvim-treesitter",     build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-context",
	{		"VonHeikemen/lsp-zero.nvim",	branch = "v3.x"},
    -- LSP Support
    { "neovim/nvim-lspconfig" }, -- Required
    { "williamboman/mason.nvim" }, -- Optional
    { "williamboman/mason-lspconfig.nvim" }, -- Optional

    -- Autocompletion
    { "hrsh7th/nvim-cmp" }, -- Required
    { "hrsh7th/cmp-nvim-lsp" }, -- Required
    { "hrsh7th/cmp-buffer" }, -- Optional
    { "hrsh7th/cmp-path" }, -- Optional
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl",       opts = {} },
    { "hrsh7th/vim-vsnip" },
    { "hrsh7th/vim-vsnip-integ" },
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	"itchyny/lightline.vim",
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
		end,
	},
	"ahmedkhalf/project.nvim",
	-- Breaks putting double quotes in some file.
	-- Seems to be conflicting with someting else.
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
	"ray-x/lsp_signature.nvim",
	-- {
	--     "saecki/crates.nvim",
	--     tag = "v0.3.0",
	--     requires = { "nvim-lua/plenary.nvim" },
	--     config = function()
	--         require("crates").setup()
	--     end
	-- }
})
