-- My little cheatsheet
--:lua vim.print(package.loaded)
--
--
--
--
require('plugins')
require('options')
require('mappings')
require('autocmds')

-- local function basic_text_objects()
--     local chars = { '_', '.', ':', ',', ';', '|', '/', '\\', '*', '+', '%', '`', '?' }
--     for _,char in ipairs(chars) do
--         for _,mode in ipairs({ 'x', 'o' }) do
--             vim.api.nvim_set_keymap(mode, "i" .. char, string.format(':<C-u>normal! T%svt%s<CR>', char, char, char), { noremap = true, silent = true })
--             vim.api.nvim_set_keymap(mode, "a" .. char, string.format(':<C-u>normal! F%svf%s<CR>', char, char, char), { noremap = true, silent = true })
--         end
--     end
-- end
-- 
-- return {
--     basic_text_objects = basic_text_objects
-- }

local function select_indent()
    local start_indent = vim.fn.indent(vim.fn.line('.'))
    local prev_line = vim.fn.line('.') - 1
    while prev_line > 0 and vim.fn.indent(prev_line) >= start_indent do
        vim.cmd('-')
        prev_line = vim.fn.line('.') - 1
    end

    vim.cmd('normal! 0V')

    local next_line = vim.fn.line('.') + 1
    local last_line = vim.fn.line('$')
    while next_line <= last_line and vim.fn.indent(next_line) >= start_indent do
        vim.cmd('+')
        next_line = vim.fn.line('.') + 1
    end
end

function indent_text_objects()
    for _,mode in ipairs({ 'x', 'o' }) do
        vim.api.nvim_set_keymap(mode, 'ii', ':<c-u>lua select_indent()<cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap(mode, 'ai', ':<c-u>lua select_indent()<cr>', { noremap = true, silent = true })
    end
end

return {
    indent_text_objects = indent_text_objects,
}

