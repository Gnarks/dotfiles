
return {
  "barreiroleo/ltex_extra.nvim",
  ft = { "markdown", "tex" },
  dependencies = { "neovim/nvim-lspconfig" },
  -- yes, you can use the opts field, just I'm showing the setup explicitly
  config = function()
    require("ltex_extra").setup {
      load_langs = { "en-GB", "fr" }, -- languages for witch dictionaries will be loaded
      init_check = true, -- whether to load dictionaries on startup
      path = "", -- project root or current working directory
      log_level = "none", -- "none", "trace", "debug", "info", "warn", "error", "fatal"

      -- need to keep this in to not get errors from the ltex attach
      server_opts = {
        on_attach = function(client, bufnr)
          -- your on_attach process
        end,
      },
    }
  end
}
