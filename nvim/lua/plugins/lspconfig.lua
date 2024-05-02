return {
    "neovim/nvim-lspconfig",
    opts = {},
    config = function()
        local lspconf = require("lspconfig")
        lspconf.lua_ls.setup({})
        --         lspconf.clangd.setup({})
        --         lspconf.bashls.setup({})
        --         lspconf.pyright.setup({})
        --
        --         lspconf.rust_analyzer.setup({})
        --         lspconf.phpactor.setup({
        --             cmd = { "phpactor", "language-server" },
        --         })
        --         lspconf.java_language_server.setup({
        --             cmd = { "java-language-server" },
        --         })
    end,
}
