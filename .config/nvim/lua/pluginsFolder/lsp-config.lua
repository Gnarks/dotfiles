return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Setting up clangd (c lsp)
            --local lspconfig = require("lspconfig")
            --lspconfig.clangd.setup({})
        end,
    -- the LSPs are set up by mason-lspconfig

    },
}
