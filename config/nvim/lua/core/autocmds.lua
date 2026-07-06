local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local umbryne = augroup("Umbryne", { clear = true })

-- Resaltar temporalmente el texto copiado
autocmd("TextYankPost", {
    group = umbryne,
    desc = "Highlight yanked text",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 200,
        })
    end,
})

-- Recordar la última posición del cursor
autocmd("BufReadPost", {
    group = umbryne,
    desc = "Restore cursor position",
    callback = function(event)
        local exclude = {
            gitcommit = true,
            gitrebase = true,
        }

        if exclude[vim.bo[event.buf].filetype] then
            return
        end

        local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(event.buf)

        if mark[1] > 0 and mark[1] <= line_count then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Recargar archivos modificados fuera de Neovim
autocmd({ "FocusGained", "TermClose", "CursorHold" }, {
    group = umbryne,
    desc = "Check if file changed externally",
    command = "checktime",
})

-- Crear automáticamente directorios al guardar
autocmd("BufWritePre", {
    group = umbryne,
    desc = "Create missing directories",
    callback = function(event)
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})
