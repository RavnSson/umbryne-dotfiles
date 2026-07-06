return {

    --------------------------------------------------
    -- Icons
    --------------------------------------------------

    {
        "nvim-tree/nvim-web-devicons",

        lazy = true,
    },

    --------------------------------------------------
    -- Colorscheme
    --------------------------------------------------

    {
        "folke/tokyonight.nvim",

        priority = 1000,

        lazy = false,

        opts = require("config.ui.tokyonight"),

        config = function(_, opts)

            require("tokyonight").setup(opts)

            vim.cmd.colorscheme("tokyonight")

        end,
    },

    --------------------------------------------------
    -- Statusline
    --------------------------------------------------

    {
        "nvim-lualine/lualine.nvim",

        event = "VeryLazy",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        opts = require("config.ui.lualine"),
    },

}
