vim.o.wrap = true

vim.api.nvim_create_user_command('Snotes', function(opts)
    require('telescope.builtin').live_grep({
        search_dirs = {"/home/ahmed/dox/notes/"},
        default_text = opts.args
    })
end, {bang = true, nargs = "*"})

vim.api.nvim_set_keymap('n', '<leader>sn', ':Snotes<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>cl', 'c(#: <C-r>")<C-c>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ln', ':execute "Snotes " . substitute(substitute(getreg(\'"\'), "\\(#:", "", "g"), "\\)", "", "g")<CR>', { noremap = true, silent = true })


vim.api.nvim_create_augroup('notes', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
    group = 'notes',
    callback = function()
        vim.cmd [[
            syntax match CorrodeMyNote /\v\(MN\)/
            syntax match CorrodeClassmateNote /\v\(CN\)/
            syntax match CorrodeQuestion /\v\(\?\)/
            syntax match CorrodeAnsweredQuestion /\v\(\?v\)/
            syntax match YKConceal /\v(\(\#G\s)/ conceal
            syntax match YKConceal /\v(\(\#G\s(.*))@<=\)/ conceal
            syntax match YKExample /\v(\(\#G\s)@<=([^\)]*)\)@=/
            syntax match PurpleHighlight /\v\(\#:(.*)\)/
            syntax match UnderlinedText /\v\(#:\s\+\)\zs.*\ze\)/ containedin=PurpleHighlight
        ]]
        vim.cmd [[
            highlight PurpleHighlight ctermfg=189 guifg=#b3a0de
            highlight UnderlinedText cterm=underline gui=underline
            highlight CorrodeMyNote ctermfg=140 guifg=#af87d7
            highlight CorrodeClassmateNote ctermfg=152 guifg=#afd7d7
            highlight CorrodeQuestion ctermfg=203 guifg=#ff5f5f
            highlight CorrodeAnsweredQuestion ctermfg=121 guifg=#88ff88
            highlight YKExample ctermfg=121 guifg=#88ff88
        ]]
        vim.wo.conceallevel = 3
    end
})
