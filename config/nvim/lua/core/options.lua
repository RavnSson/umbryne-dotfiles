local opt = vim.opt

-- Apariencia
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"

-- Indentación
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

-- Búsqueda
opt.ignorecase = true
opt.smartcase = true

-- Scroll
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Comportamiento
opt.wrap = false
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- División de ventanas
opt.splitbelow = true
opt.splitright = true

-- Tiempo de respuesta
opt.updatetime = 250
opt.timeoutlen = 300
