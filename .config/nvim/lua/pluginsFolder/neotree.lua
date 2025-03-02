return {
	{
		"nvim-neo-tree/neo-tree.nvim", -- file tree to the left
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.keymap.set("n", "<leader>t", ":Neotree filesystem reveal left <CR>", {})
			require("neo-tree").setup({
				sources = { "filesystem", "buffers" },
				filesystem = {
					filtered_items = {
						hide_dotfiles = true,
					},
				},
				window = {
					mappings = {
						["<C-l>"] = "refresh",
						["<C-r>"] = "rename", -- Rename
						["l"] = "open",
						["."] = "toggle_hidden",
						["h"] = "navigate_up",
						["r"] = "rename", -- Lazy rename. Since neo-tree doesn't have a batch rename function.
						["L"] = "set_root",
					},
				},
			})
		end,
	},
}
