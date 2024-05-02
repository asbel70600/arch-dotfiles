MY_KEYMAPS = {}

local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
-- vim.keymap.set('v', '<', '<gv', opts)
-- vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set("n", "<C-A>", "<cmd>NvimTreeToggle<cr>", {})
vim.keymap.set("n", "<C-TAB>", "<cmd>bn<cr>", {})
vim.keymap.set("t", "<C-O>", "<C-\\><C-N>")
vim.keymap.set("t", "<C-TAB>", "<C-\\><C-N><cmd>bn<cr>")
vim.keymap.set("n", "<C-i>n", "<cmd>bn<cr>", {})
vim.keymap.set("n", "<C-i>p", "<cmd>bp<cr>", {})
vim.keymap.set("n", "<C-i>d", "<cmd>bd<cr>", {})
vim.keymap.set("n", "<F3>", "<cmd>lua require('conform').format({bufnr = vim.fn.bufnr('%')})<cr>", {})
vim.keymap.set("n", "<Leader>u", "", {})
vim.keymap.set(
	"n",
	"gx",
	'<cmd>normal k$/ https\\?:\\/\\/\\S\\+<CR>nyW:!hyprctl dispatch exec -- \\[fullscreen] chromium <C-R>" --new-window<CR><CR>:nohl<CR>',
	{ silent = true }
)

-- LspAttach
MY_KEYMAPS.OnLSPAttach = function(opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	--	vim.keymap.set("n", "<Leader>D", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("i", "<C-Space>", vim.lsp.buf.completion, opts)
	vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<Leader>fa", vim.lsp.buf.format)
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	vim.keymap.set("n", "<Leader>o", vim.diagnostic.open_float)
	vim.keymap.set("n", "[e", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "]e", vim.diagnostic.goto_next)
	vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist)

	vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set("n", "<Leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
end

MY_KEYMAPS.OnTelescopeReady = function()
	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
	vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
	vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
	vim.keymap.set("n", "<Leader>fh", builtin.help_tags, {})
	vim.keymap.set("n", "<Leader>fo", builtin.oldfiles, {})
	vim.keymap.set("n", "<Leader>fw", "<cmd>Telescope workspaces<cr>", {})
	--  vim.keymap.set(
	--  	"n",
	--  	"<Leader>fh",
	--  	[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
	--  	{ noremap = true, silent = true }
	--  )
end

-- https://github.com/L3MON4D3/LuaSnip/blob/master/README.md#keymaps
-- MY_KEYMAPS.onLuasnipReady = function()
-- 	vim.keymap.set({ "i", "s" }, "<Tab>", "<cmd>lua require('luasnip').jump(1)<cr>", { silent = true })
-- 	vim.keymap.set({ "i", "s" }, "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<cr>", { silent = true })
-- end


MY_KEYMAPS.OnTelescopeReady()
-- MY_KEYMAPS.onLuasnipReady()
MY_KEYMAPS.OnLSPAttach()

-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<C-I>",
-- 	":lua require('_headers_mappings').MAPPING_HEADERS.Delbuffers()<CR>",
-- 	{ noremap = true }
-- )
-- local function openUrlInBrowser()
--     local currentWORD = vim.fn.expand("<cWORD>")
--     if string.find(currentWORD,"https://%s+")
--     then
--         vim.cmd("normal \"*yiw")
--     end
-- end
