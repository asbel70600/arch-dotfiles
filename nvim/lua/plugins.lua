require("_headers_plugins")

-- ----------------------------------
-- Lazy Vim  ------------------------
-- -----------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=ilob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{ "nvim-lua/plenary.nvim" },
	{ "catppuccin/nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "savq/melange-nvim" },
	{ "tanvirtin/monokai.nvim" },
	{
		"Shatur/neovim-ayu",
		config = MY_PLUGINS_CONFIG.setColorScheme,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		config = MY_PLUGINS_CONFIG.setupTelescope,
	},
	{
		"smartpde/telescope-recent-files",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = MY_PLUGINS_CONFIG.setupTreesetter,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = MY_PLUGINS_CONFIG.setupDevicons,
	},
	{
        "folke/neodev.nvim",
        opts = {},
        config = function() require("neodev").setup({}) end
    },
	{
		"neovim/nvim-lspconfig",
		config = MY_PLUGINS_CONFIG.setuplspconf,
	},
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/cmp-buffer",
	},
	{
		"hrsh7th/cmp-path",
	},
	{
		"hrsh7th/cmp-cmdline",
	},
	{
		"hrsh7th/nvim-cmp",
		config = MY_PLUGINS_CONFIG.setupCmp,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = MY_PLUGINS_CONFIG.setupNeoTree,
	},
	{
		"simnalamburt/vim-mundo",
		config = function() end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = MY_PLUGINS_CONFIG.setupNoice,
	},
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 0
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	--     {
	--         "",
	--         config = function ()
	--         end
	--     },
	--     {
	--         "",
	--         config = function ()
	--         end
	--     },
	--     {
	--         "",
	--         config = function ()
	--         end
	--     },
})
