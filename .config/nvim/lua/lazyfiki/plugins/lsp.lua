return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
    },

    config = function()
        local cmp = require("cmp")

        cmp.setup({
            completion = {
                autocomplete = {
                    cmp.TriggerEvent.TextChanged,
                },
            },

            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
            }),

            sources = {
                { name = "nvim_lsp" },
                { name = "path" },
            },
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.lsp.handlers["textDocument/hover"] = function() end
        vim.lsp.handlers["textDocument/signatureHelp"] = function() end

        vim.diagnostic.config({
            virtual_text = false,
            signs = false,
            underline = false,
            update_in_insert = false,
        })

        local servers = { "lua_ls" }

        for _, server in ipairs(servers) do
            vim.lsp.config(server, {
                capabilities = capabilities,
            })
        end

        vim.lsp.enable(servers)
    end,
}
