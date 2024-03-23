-- require("mappings")
--

MY_PLUGINS_CONFIG = {}
MY_PLUGINS_KEYMAPS = {}

MY_PLUGINS_KEYMAPS.treesitterSelectionKeymaps = {
    init_selection = "<Leader>ss",
    node_incremental = "<Leader>si",
    scope_incremental = "<Leader>so",
    node_decremental = "<Leader>sd",
}

MY_PLUGINS_KEYMAPS.treesitterTextObjectKeymaps = {

    ["af"] = "@function.outer",
    ["if"] = "@function.inner",

    ["ii"] = "@conditional.inner",

    ["al"] = "@loop.outer",
    ["il"] = "@loop.inner",

    ["ap"] = "@parameter.outer",
    ["ip"] = "@parameter.inner",

    ["ir"] = "@return.inner",

    ["ac"] = "@call.outer",
    ["ic"] = "@call.inner",
}

MY_PLUGINS_KEYMAPS.textobjectMoves = {
    goto_next_start = {
        ["]f"] = "@function.outer",
    },
    goto_previous_start = {
        ["[F"] = "@function.outer",
    },
}

MY_PLUGINS_KEYMAPS.completion = function(cmp)
    return {}
end

MY_PLUGINS_CONFIG.setColorScheme = function()
    vim.cmd.colorscheme("ayu-dark")
end

MY_PLUGINS_CONFIG.setuplspconf = function()
    local lspconf = require("lspconfig")
    lspconf.lua_ls.setup({})
    lspconf.clangd.setup({})
    lspconf.bashls.setup({})
--    lspconf.pyright.setup({})
    lspconf.pylyzer.setup({})
    lspconf.rust_analyzer.setup({})
end

MY_PLUGINS_CONFIG.setupDevicons = function()
    require("nvim-web-devicons").setup({})
end

-- https://github.com/nvim-treesitter/nvim-treesitter
MY_PLUGINS_CONFIG.setupTreesetter = function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
        sync_install = true,
        auto_install = true,
        indent = {
            enable = true,
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
            enable = true,
            keymaps = MY_PLUGINS_KEYMAPS.treesitterSelectionKeymaps,
        },
        -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        textobjects = {
            select = {
                keymaps = MY_PLUGINS_KEYMAPS.treesitterTextObjectKeymaps,
            },
            move = MY_PLUGINS_KEYMAPS.textobjectMoves,
        },
    })
end

MY_PLUGINS_CONFIG.setupTelescope = function()
    require("telescope").setup({
        defaults = {
            file_ignore_patterns = {
                '.*/usr/share/nvim.*',
                '.*/nvim/lazy.*',
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
    })
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("recent_files")
end

MY_PLUGINS_CONFIG.setupNvimTree = function()
    require("nvim-tree").setup({
        sort = {
            sorter = "case_insensitive",
        },
        view = {
            width = 30,
        },
    })
end

MY_PLUGINS_CONFIG.setupNeoTree = function()
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

    require("neo-tree").setup({
        close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        enable_normal_mode_for_inputs = false, -- Enable normal mode for input dialogs.
        sort_case_insensitive = false, -- used when sorting files and directories in the tree
        window = {
            position = "left",
            width = 30,
            mapping_options = {
                noremap = true,
                nowait = true,
            },
        },
        filesystem = {
            follow_current_file = {
                enabled = false, -- This will find and focus the file in the active buffer every time
                --               -- the current file is changed while the tree is open.
                leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            group_empty_dirs = false, -- when true, empty folders will be grouped together
            hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
            -- in whatever position is specified in window.position
            -- "open_current",  -- netrw disabled, opening a directory opens within the
            -- window like netrw would, regardless of window.position
            -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
            use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
            -- instead of relying on nvim autocmd events.
        },
        buffers = {
            follow_current_file = {
                enabled = true, -- This will find and focus the file in the active buffer every time
                --              -- the current file is changed while the tree is open.
                leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            group_empty_dirs = true, -- when true, empty folders will be grouped together
            show_unloaded = true,
        },
    })
end

-- https://github.com/L3MON4D3/LuaSnip
MY_PLUGINS_CONFIG.setupCmp = function()
    -- Set up nvim-cmp.
    local cmp = require("cmp")

    cmp.setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),

        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" }, -- For luasnip users.
            }, {
                { name = "buffer" },
        }),
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
            { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
            }, {
                { name = "buffer" },
        }),
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
            }, {
                { name = "cmdline" },
        }),
    })

    -- Set up lspconfig.
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require("lspconfig")["lua_ls"].setup({
        capabilities = capabilities,
    })
end

MY_PLUGINS_CONFIG.cmdline = function()
    require('fine-cmdline').setup({
        cmdline = {
            enable_keymaps = true,
            smart_history = true,
            prompt = ': '
        },
        popup = {
            position = {
                row = '10%',
                col = '50%',
            },
            size = {
                width = '60%',
            },
            border = {
                style = 'rounded',
            },
            win_options = {
                winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
            },
        },
        hooks = {
            before_mount = function(input)
                -- code
            end,
            after_mount = function(input)
                -- code
            end,
            set_keymaps = function(imap, feedkeys)
                -- code
            end
        }
    })
end

MY_PLUGINS_CONFIG.setupNoice = function ()
    require("noice").setup({
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
        },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
        },
    })

end
