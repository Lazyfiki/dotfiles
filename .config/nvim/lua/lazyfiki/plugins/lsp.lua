return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local util = require("lspconfig.util")

        local capabilities = cmp_lsp.default_capabilities()

        -- Table of servers
        local servers = {
            zls = {
                cmd = { "zls" },
                root_dir = util.root_pattern(".git", "build.zig", "zls.json"),
                filetypes = { "zig" },
            },
            lua_ls = {
                cmd = { "lua-language-server" },
                root_dir = util.root_pattern(".git", "."),
                filetypes = { "lua" },
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            },
        }

        -- Register configs
        for name, config in pairs(servers) do
            config.capabilities = capabilities
            vim.lsp.config[name] = { default_config = config }

            -- Autostart on matching filetypes
            vim.api.nvim_create_autocmd("FileType", {
                pattern = config.filetypes,
                callback = function()
                    vim.lsp.start(vim.lsp.config[name])
                end,
            })
        end

        -- nvim-cmp setup
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<CR>"]  = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = {
                { name = "nvim_lsp" },
            },
        })
    end,
}

