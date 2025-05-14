return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.tex_flavor = "latex"
    vim.opt.syntax = "on"
  end
}
