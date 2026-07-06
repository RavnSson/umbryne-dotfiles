local keymap = vim.keymap.set

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Mejor experiencia
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Guardar
keymap({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save file" })

-- Salir del modo inserción
keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Navegación entre ventanas
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Redimensionar ventanas
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize window up" })
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize window down" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize window left" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize window right" })

-- Mantener selección al indentar
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Mover líneas
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")
