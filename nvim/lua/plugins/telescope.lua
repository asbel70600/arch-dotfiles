return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case", -- or 'ignore_case' or 'respect_case'
            },
            workspaces = {
                  keep_insert = true,
            }
        },
    },
    config = function ()
        require("telescope").load_extension("recent_files")
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("workspaces")
    end,
}
