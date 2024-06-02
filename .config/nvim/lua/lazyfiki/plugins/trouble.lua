return {
    "folke/trouble.nvim",

    config = function()
        require("trouble").setup {
            icons = false,
            signs = {
                error = "E",
                warning = "W",
                hint = "H",
                information = "I",
                other = "O",
            },
            fold_open = "v",
            fold_closed = ">",
        }

        vim.keymap.set("n", "<leader>t", function() require("trouble").toggle() end)
    end,
}
