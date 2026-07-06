local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    vim.notify(
        "lazy.nvim is not installed:\n" .. lazypath,
        vim.log.levels.ERROR
    )
    return
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(require("plugins"), {

    checker = {
        enabled = true,
    },

    change_detection = {
        notify = false,
    },

    install = {
        colorscheme = {
            "tokyonight",
        },
    },

    ui = {
        border = "rounded",
    },

})
