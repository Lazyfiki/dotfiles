function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    local path = vim.fn.expand("~/.cache/wal/colors.json")
    local colors = vim.fn.json_decode(vim.fn.readfile(path))
    vim.api.nvim_set_hl(0, "StatusLine", {
        bg = colors.colors.color1,
        fg = colors.special.background
    })
    vim.api.nvim_set_hl(0, "StatusLineNC", {
        bg = colors.special.foreground,
        fg = colors.special.background
    })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = colors.colors.color8 })
end

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                styles = {
                    bold = true,
                    italic = true,
                    transparency = true,
                },
            })
            ColorMyPencils()
        end,
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
            })
        end
    },
}
