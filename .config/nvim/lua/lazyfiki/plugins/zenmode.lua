return {
    "folke/zen-mode.nvim",
    config = function()
        vim.keymap.set("n", "<leader>zz", function()
            require("zen-mode").setup {
                window = {
                    width = 90,
                    options = { }
                },
            }
            require("zen-mode").toggle()
            vim.wo.wrap = false
            vim.wo.number = true
            vim.wo.rnu = true
            ColorMyPencils()
        end)


        vim.keymap.set("n", "<leader>zZ", function()
            require("zen-mode").setup {
                window = {
                    width = 80,
                    options = { }
                },
            }
            require("zen-mode").toggle()
            vim.wo.wrap = true
            vim.wo.linebreak = true
            vim.wo.breakindent = true

            vim.wo.number = false
            vim.wo.rnu = false

            vim.keymap.set("n", "j", "gj", { buffer = true })
            vim.keymap.set("n", "k", "gk", { buffer = true })
            vim.opt.colorcolumn = "0"

            ColorMyPencils()
            local path = vim.fn.expand("~/.cache/wal/colors.json")
            local colors = vim.fn.json_decode(vim.fn.readfile(path))
            vim.api.nvim_set_hl(0, "Normal",      { fg = colors.colors.color4, bg = "none" })
            vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = "#ff5555", })
        end)
    end
}
