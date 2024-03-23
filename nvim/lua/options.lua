vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.guifont = "JetBrainsMonoNL NFM SemiBold:h18"
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 0

-- Folding with treesitter
-- vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
--vim.opt.Folding = false

-- disable default tree so nvim-tree works
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--echo nvim_treesitter#statusline(90)  " 90 can be any length
--module->expression_statement->call->identifier
