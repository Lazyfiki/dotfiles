return {
    "ej-shafran/compile-mode.nvim",
    version = "^5.0.0",
    branch = "latest",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        ---@type CompileModeOpts
        vim.g.compile_mode = {
            bang_expansion = true,
            use_pseudo_terminal = false,
        }
    end
}
