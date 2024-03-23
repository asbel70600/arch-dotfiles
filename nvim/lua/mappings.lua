MY_KEYMAPS = {}

vim.api.nvim_set_keymap(
	"n",
	"<C-I>",
	":lua require('_headers_mappings').MAPPING_HEADERS.Delbuffers()<CR>",
	{ noremap = true }
)
local function openUrlInBrowser()
    local currentWORD = vim.fn.expand("<cWORD>")
    if string.find(currentWORD,"https://%s+")
    then
        vim.cmd("normal \"*yiw")
    end
end

vim.keymap.set("n", "<c-a>", "<cmd>Neotree toggle<cr>", {})
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
	--                                                                      https://asdfasdfasdfasdf
	-- https://asdfasdfasdfasdf https://asdfasdfasdfasdf
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
   --  vim.keymap.set(
   --  	"n",
   --  	"<Leader>fh",
   --  	[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
   --  	{ noremap = true, silent = true }
   --  )
end

-- https://github.com/L3MON4D3/LuaSnip/blob/master/README.md#keymaps
MY_KEYMAPS.onLuasnipReady = function()
    vim.keymap.set({ "i", "s" }, "<Tab>","<cmd>lua require('luasnip').jump(1)<cr>",{ silent = true })
    vim.keymap.set({ "i", "s" }, "<S-Tab>","<cmd>lua require('luasnip').jump(-1)<cr>",{ silent = true })
end

vim.keymap.set("t", "<C-O>", "<C-\\><C-N>")

MY_KEYMAPS.OnTelescopeReady()
MY_KEYMAPS.onLuasnipReady()
MY_KEYMAPS.OnLSPAttach()
