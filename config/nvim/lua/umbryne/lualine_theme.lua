local c = require("umbryne.palette")

return {

    normal = {
        a = {
            fg = c.bg,
            bg = c.purple,
            gui = "bold",
        },
        b = {
            fg = c.text,
            bg = c.surface,
        },
        c = {
            fg = c.comment,
            bg = c.bg,
        },
    },

    insert = {
        a = {
            fg = c.bg,
            bg = c.green,
            gui = "bold",
        },
    },

    visual = {
        a = {
            fg = c.bg,
            bg = c.cyan,
            gui = "bold",
        },
    },

    replace = {
        a = {
            fg = c.bg,
            bg = c.red,
            gui = "bold",
        },
    },

    command = {
        a = {
            fg = c.bg,
            bg = c.orange,
            gui = "bold",
        },
    },

    inactive = {
        a = {
            fg = c.comment,
            bg = c.bg,
        },
        b = {
            fg = c.comment,
            bg = c.bg,
        },
        c = {
            fg = c.comment,
            bg = c.bg,
        },
    },

}
