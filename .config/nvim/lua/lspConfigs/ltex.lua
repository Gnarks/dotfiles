-- special config for the ltex lsp
-- adds a jmv arg to overcome the XML limit for english dictionnaries

vim.env.JAVA_TOOL_OPTIONS = "-Djdk.xml.totalEntitySizeLimit=0"
local function setup_ltex(lang)
	local config = {
		on_attach = function()
			require('ltex_extra').setup {
				load_langs = { 'en-GB', 'fr-FR' },
				-- init_check = true,
				path = ".ltex"
			}
			vim.api.nvim_create_user_command("LtexLang", function(args)
				-- get the argument
				local splited_args = vim.split(args.args, " ", { trimempty = true })
				-- get the ltex lsp client
				local clients = vim.lsp.get_clients({ name = "ltex" })
				local client = clients[1]

				-- get the client config
				client.config.settings.ltex = client.config.settings.ltex or {}
				client.config.settings.ltex.language = splited_args[1]
				-- notify the client of the change
				client:notify("workspace/didChangeConfiguration", {
					settings = client.config.settings
				})

				-- setup_ltex(splited_args[1])
			end, { nargs = 1 })
		end,
		settings = {
			language = lang,
		},
	}
	vim.lsp.config.ltex = config
end
setup_ltex('en-GB')


-- vim.lsp.config.ltex = {
-- 	-- supports english and french
-- 	language = { "en-US", "fr-FR", },
--
-- 	-- asks for ltex_extra to be set up
-- 	-- permits to use the code action to add words in dictionnaries stored localy
-- 	-- might be helpfull to create a global dictionnary
-- 	on_attach = function()
-- 		require("ltex_extra").setup {
-- 			load_langs = { "en-US", "fr-FR" }, -- en-US as default
-- 			-- check for an existing dictionnary on load
-- 			init_check = true,
-- 			-- string : relative or absolute path to store dictionaries
-- 			-- e.g. subfolder in the project root or the current working directory: ".ltex"
-- 			-- e.g. shared files for all projects:  vim.fn.expand("~") .. "/.local/share/ltex"
-- 			path = ".ltex", -- project root or current working directory
--
-- 		}
-- 	end,
-- }
