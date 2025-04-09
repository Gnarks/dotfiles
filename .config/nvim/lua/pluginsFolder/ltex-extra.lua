return {
    "barreiroleo/ltex_extra.nvim",
    ft = { "markdown", "tex" },
    dependencies = {"neovim/nvim-lspconfig"},

  config = function()
    require("ltex_extra").setup {
      load_langs = { "en-US", "fr" }, -- en-US as default
      -- boolean : whether to load dictionaries on startup
      init_check = true,
      -- string : relative or absolute path to store dictionaries
      -- e.g. subfolder in the project root or the current working directory: ".ltex"
      -- e.g. shared files for all projects:  vim.fn.expand("~") .. "/.local/share/ltex"
      path = "", -- project root or current working directory
      log_level = "none",
      -- table : configurations of the ltex language server.
      -- Only if you are calling the server from ltex_extra
      server_opts = nil
    }
  end
}
