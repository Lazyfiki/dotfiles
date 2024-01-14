return {
    "danymat/neogen",

    config = function()
        local neogen = require('neogen')
        neogen.setup({
            snippet_engine = "luasnip"
        })

        vim.keymap.set("n", "<leader>nf", function()
            neogen.generate({ type = "func" })
        end)

        vim.keymap.set("n", "<leader>nt", function()
            neogen.generate({ type = "type" })
        end)

        vim.keymap.set("n", "<leader>nd", function()
            neogen.generate({ type = "typedef" })
        end)
    end,
}
