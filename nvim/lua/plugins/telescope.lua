return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        "nvim-lua/plenary.nvim",
    },
    opts = {
        defaults = {
            file_ignore_patterns = {
                ".*/usr/share/nvim.*",
                ".*/nvim/lazy.*",
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case", -- or 'ignore_case' or 'respect_case'
            },
        },
    },
    config = function()
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("recent_files")
    end,
}
