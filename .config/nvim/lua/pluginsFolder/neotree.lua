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
            ["l"] = "custom_open",
            ["."] = "toggle_hidden",
            ["h"] = "navigate_up",
            ["r"] = "rename", -- Lazy rename. Since neo-tree doesn't have a batch rename function.
            ["L"] = "set_root",
          },
        },
        commands = {
          custom_open = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            local extension = path:match "%.(%a-)$"

            local extension_list = {
              "pdf",
              "png",
              "jpg"
            }
            local flag = 0

            for _, i in pairs(extension_list) do
              if i == extension then
                flag = 1
                break
              end
            end

            if node.type == "directory" or flag == 0 then
              require('neo-tree.sources.filesystem.commands').open(state)
            else
              vim.fn.jobstart({ "xdg-open", path }, { detach = true })
            end
          end

        },
      })
    end,
  },
}
