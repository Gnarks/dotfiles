return {
    {  -- create a table with a config function.  
        -- the config function is only called when lazy is sure that the plugin is installed
        "marko-cerovac/material.nvim",
        --[[config = function()
            vim.cmd.colorscheme("material-deep-ocean") -- hence we put the line here to be sure that there is no race conditions (plugin not loaded but called as colorscheme)
        end,]]
    },

    {
        "nyoom-engineering/oxocarbon.nvim",
        --[[config = function()
            vim.cmd.colorscheme("oxocarbon")
        end,]]

    },

    {
        "EdenEast/nightfox.nvim",
        config = function()
            vim.cmd.colorscheme("carbonfox")
        end,
    }
}
