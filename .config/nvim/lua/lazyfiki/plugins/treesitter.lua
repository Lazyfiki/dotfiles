return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
    },
    build = ":TSUpdate",

    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" },
            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end,
}
