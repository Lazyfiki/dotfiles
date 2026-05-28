return {
    "Vonr/align.nvim",
    branch = "v2",
    lazy = true,
    init = function()
        vim.keymap.set(
            "x",
            "al",
            function()
                require"align".align_to_string({
                    preview = true,
                    regex = true,
                })
            end,
            { noremap = true, silent = true }
        )
    end
}
