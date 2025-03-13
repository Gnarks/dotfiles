return   {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        -- Asking for the mason;nvim plugin to be loaded specificaly before 
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup()

            -- setting up all lsps installed with mason
            require("mason-lspconfig").setup_handlers({
                function (server_name)
                    require("lspconfig")[server_name].setup({ settings = {signatureHelp = {enable = true}; }})
                end,
            })
        end,
    },
}
