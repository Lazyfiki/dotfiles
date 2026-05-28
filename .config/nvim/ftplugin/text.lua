vim.wo.spell = true
vim.bo.spelllang = "en"

vim.api.nvim_set_hl(0, "SpellBad", {
  undercurl = true,
  sp = "#ff5555",
})
