return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },

    config = function()
        local cmp = require("cmp")

        local function smart_complete()
            if cmp.visible() then
                cmp.confirm({ select = true })
                return
            end

            cmp.complete()

            vim.defer_fn(function()
                local entries = cmp.get_entries()
                if #entries == 1 then
                    cmp.confirm({ select = true })
                end
            end, 10)
        end

        cmp.setup({
            completion = {
                autocomplete = false,
            },

            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = smart_complete,
            }),

            sources = {
                { name = "buffer" },
                { name = "path" },
            },
        })
    end,
}
