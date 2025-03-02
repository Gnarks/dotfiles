return {
    {
    	"nvim-treesitter/nvim-treesitter", -- gives a better syntax tree to neovim 
    	config = function()
    		require("nvim-treesitter.configs").setup({

    			ensure_installed = {"c", "lua", "vim", "vimdoc", "query"},

    			auto_install = true, -- will install the right package if not installed yet

    			highlight = { enable = true },

    			indent = { enable = true },

                require'nvim-treesitter.configs'.setup {
                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            init_selection = "<leader>ss", -- start selection
                            node_incremental = "<leader>si", -- selection increment
                            scope_incremental = "<leader>sc", -- scope
                            node_decremental = "<leader>sd", -- selection decrease
                        },
                   },
                    textobjects = {
                        select = {
                            enable = true,

                            -- Automatically jump forward to textobj, similar to targets.vim
                            lookahead = true,

                            keymaps = {
                                -- You can use the capture groups defined in textobjects.scm
                                -- these are motions (just like w, j, b, k) not commands
                                ["af"] = "@function.outer", -- around function
                                ["if"] = "@function.inner", -- in function
                                ["ac"] = "@class.outer",
                                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                                -- nvim_buf_set_keymap) which plugins like which-key display
                                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                                -- You can also use captures from other query groups like `locals.scm`
                                ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                            },
                            -- You can choose the select mode (default is charwise 'v')
                            --
                            -- Can also be a function which gets passed a table with the keys
                            -- * query_string: eg '@function.inner'
                            -- * method: eg 'v' or 'o'
                            -- and should return the mode ('v', 'V', or '<c-v>') or a table
                            -- mapping query_strings to modes.
                            selection_modes = {
                                ['@parameter.outer'] = 'v', -- charwise
                                ['@function.outer'] = 'V', -- linewise
                                ['@class.outer'] = '<c-v>', -- blockwise
                            },
                            -- If you set this to `true` (default is `false`) then any textobject is
                            -- extended to include preceding or succeeding whitespace. Succeeding
                            -- whitespace has priority in order to act similarly to eg the built-in
                            -- `ap`.
                            --
                            -- Can also be a function which gets passed a table with the keys
                            -- * query_string: eg '@function.inner'
                            -- * selection_mode: eg 'v'
                            -- and should return true or false
                            include_surrounding_whitespace = true,
                        },
                    },
                }
    		})
    	end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
}
