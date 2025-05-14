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
    vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.colors.color1 })

    vim.api.nvim_set_hl(0, 'OilDir', { fg = colors.colors.color4, bold = true })
    vim.api.nvim_set_hl(0, 'OilFile', { fg = colors.special.foreground })
    vim.api.nvim_set_hl(0, 'OilLink', { fg = colors.colors.color6, bold = true })
    vim.api.nvim_set_hl(0, 'OilLinkTarget', { fg = colors.special.foreground })
    vim.api.nvim_set_hl(0, 'OilOrphanLink', {
        fg = colors.colors.color1,
        bg = colors.colors.color0,
        bold = true
    })
    vim.api.nvim_set_hl(0, 'OilOrphanLinkTarget', {
        fg = colors.colors.color1,
        bg = colors.colors.color0,
        bold = true
    })
    vim.api.nvim_set_hl(0, 'WinBar', {
        fg = colors.special.foreground,
        bg = colors.colors.color0,
    })
end

vim.api.nvim_create_user_command("ReloadColors", function()
    ColorMyPencils()
end, {})

return {
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
}
