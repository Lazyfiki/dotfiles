vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.cmd('highlight GitSignsAdd guibg=NONE')
vim.cmd('highlight GitSignsChange guibg=NONE')
vim.cmd('highlight GitSignsDelete guibg=NONE')

local Lazyfiki_Fugitive = vim.api.nvim_create_augroup("Lazyfiki_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = Lazyfiki_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}

        vim.keymap.set("n", "<leader>gp", function()
            vim.cmd.Git('push')
        end, opts)

        vim.keymap.set("n", "<leader>ga", function()
            vim.cmd.Git('add')
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({'pull',  '--rebase'})
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>gt", ":Git push -u origin ", opts);
    end,
})
