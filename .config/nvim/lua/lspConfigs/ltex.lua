-- special config for the ltex lsp
-- adds a jmv arg to overcome the XML limit for english dictionnaries

vim.env.JAVA_TOOL_OPTIONS = "-Djdk.xml.totalEntitySizeLimit=0"
vim.lsp.config.ltex = {
  -- supports english and french
  language = { "en-US", "fr-FR", },

  -- asks for ltex_extra to be set up
  -- permits to use the code action to add words in dictionnaries stored localy
  -- might be helpfull to create a global dictionnary
  on_attach = function()
    require("ltex_extra").setup {
      load_langs = { "en-US", "fr-FR" }, -- en-US as default
      -- check for an existing dictionnary on load
      init_check = true,
      -- string : relative or absolute path to store dictionaries
      -- e.g. subfolder in the project root or the current working directory: ".ltex"
      -- e.g. shared files for all projects:  vim.fn.expand("~") .. "/.local/share/ltex"
      path = ".ltex", -- project root or current working directory

    }
  end,
}
