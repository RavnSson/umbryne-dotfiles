return vim.iter({

    require("plugins.ui"),

    require("plugins.editor"),

    require("plugins.navigation"),

    require("plugins.lsp"),

    require("plugins.git"),

}):flatten():totable()
