return {
  {
    -- the nvim cmp that cooks 
    'hrsh7th/nvim-cmp',
    priority = 100,

    dependencies = {
      'hrsh7th/cmp-nvim-lsp',-- connection beetween nvim cmp and nvim lsp
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',-- to get informations from the buffer an give it to cmp
      'hrsh7th/cmp-path',-- to give info from the path and give it to cmp
      -- gives more info context from the lsp
      -- permits to move through the snippet
      {'L3MON4D3/LuaSnip', build = "make install_jsregexp CC=gcc.exe SHELL=C:/path/to/sh.exe .SHELLFLAGS=-c",
        dependencies = {"rafamadriz/friendly-snippets"}
      },

      'saadparwaiz1/cmp_luasnip',-- connection between luasnip and cmp
      'onsails/lspkind.nvim',
    },
    config = function()


      --setup kindlsp
      local lspkind = require('lspkind')

      --setup de luasnip
      local ls = require("luasnip")
      require("luasnip/loaders/from_vscode").lazy_load()

      vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, {silent = true})


      -- setup de nvim cmp
      local cmp = require("cmp")
      cmp.setup({
        sources = {
          {name = "luasnip"},
          {name = "nvim_lsp"},
          {name = "nvim_lsp_signature_help"},
          {name = "buffer"},
          {name = "path"},
        },
        mapping = {
          ["<C-j>"] = cmp.mapping.select_next_item {behavior = cmp.SelectBehavior.Insert},
          ["<C-k>"] = cmp.mapping.select_prev_item {behavior = cmp.SelectBehavior.Insert},
          ["<C-l>"] = cmp.mapping(cmp.mapping.confirm {
            select = true,},
            {"i","c"}
          ),
        },
        snippet = {
          expand = function (args)
            require("luasnip").lsp_expand(args.body)
          end
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = {
              -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
              menu = 50, -- leading text (labelDetails)
              abbr = 50, -- actual suggestion item
            },
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
            menu = ({
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
              nvim_lsp = "[Lsp]",
              nvim_lsp_signature_help = "[Sign]",
            })
          })
        },

      })
    end,

  },
}
