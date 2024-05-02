vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return{
    "nvim-tree/nvim-tree.lua",
    name = "nvim-tree",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {},
--     opts = {
--         sort = {
--             sorter = "case_sensitive",
--         },
--         view = {
--             width = 30,
--         },
--         renderer = {
--             group_empty = true,
--         },
--         filters = {
--             dotfiles = true,
--         }
--     }
}
