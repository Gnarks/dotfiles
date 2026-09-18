return {
	"urtzienriquez/zotero.nvim",
	config = function()
		require("zotero").setup({
			-- Path to zotero.sqlite. Auto-detected if not set.
			-- Searches: ~/Zotero/, ~/.zotero/, ~/.local/share/zotero/, etc.
			db_path = nil,

			-- Initial sort column.
			-- Available: "dateAdded" | "year" | "title" | "dateModified"
			default_sort = "dateAdded",

			-- Initial sort direction.
			default_sort_dir = "desc",

			-- Max items loaded at once (prevents lag with huge libraries).
			max_items = 500,

			-- Command to open PDF attachments.
			-- Examples: "xdg-open", "zathura", "open", "evince"
			pdf_viewer = "xdg-open",

			-- Fuzzy search backend.
			-- Valid: "fzf" | "telescope"
			-- Not insalled though
			backend = "fzf",

			-- Columns to display in the items table.
			-- Available: "#", "key", "title", "authors", "year", "journal",
			--            "dateAdded", "type"
			columns = { "#", "key", "title", "authors", "year", "journal", "dateAdded" },

			keymaps = {
				enabled                     = true, -- master switch; false disables all keymaps
				open_library                = "<leader>zz", -- toggle Zotero browser
				fuzzy_find                  = "<leader>zf", -- fuzzy search items

				-- Items pane keymaps (set nil or false to disable individual keymaps)
				items_show_detail           = "l",
				items_open_attachment       = "<leader>l",
				items_open_url              = "<leader>zl",
				items_edit_item             = "<leader>ze",
				items_import_pdf            = "<leader>zi",
				items_attach_pdf            = "<leader>za",
				items_move_to_collection    = "<leader>zM",
				items_add_by_identifier     = "<leader>zn",
				items_delete                = "<leader>zD",
				items_sort_title            = "<leader>zs",
				items_sort_year             = "<leader>zS",
				items_sort_date_added       = "<leader>zd",
				items_search                = "<leader>z/",
				items_clear_search          = "<leader>zc",
				items_refresh               = "<leader>zr",
				items_toggle_columns        = "<leader>zv",
				items_toggle_collections    = "<leader>zt",
				items_toggle_mark           = "<leader>zm",
				items_show_only_marked      = "<leader>zl",
				toggle_statuscolumn         = "<leader>zg",
				items_focus_collections     = "<Tab>",
				items_show_help             = "g?",

				-- Collections pane keymaps
				collections_move_down       = "j",
				collections_move_up         = "k",
				collections_next_section    = "]]",
				collections_prev_section    = "[[",
				collections_select          = "l",
				collections_toggle_pane     = "<leader>zt",
				collections_focus_items     = "<Tab>",
				collections_new             = "<leader>zN",
				collections_delete          = "<leader>zD",
				collections_focus_items_esc = "<Esc>",
				collections_show_help       = "g?",
			},
		})
	end,
}
