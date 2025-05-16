return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- Asking for the mason.nvim plugin to be loaded specificaly before
    dependencies = { "williamboman/mason.nvim" },
  },
}
