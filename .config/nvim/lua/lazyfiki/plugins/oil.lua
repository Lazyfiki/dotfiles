return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    config = function()
        function _G.get_oil_winbar()
            local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
            local dir = require("oil").get_current_dir(bufnr)
            if dir then
                return vim.fn.fnamemodify(dir, ":$HOME")
            else
                -- If there is no current directory (e.g. over ssh), just show the buffer name
                return vim.api.nvim_buf_get_name(0)
            end
        end

        require("oil").setup({
            default_file_explorer = true,
            columns = {
                "permissions",
                "size",
                "mtime",
                -- {"mtime", format = "%_m月%d日 %H:%M"},
            },

            skip_confirm_for_simple_edits = true,
            prompt_save_on_select_new_entry = false,
            watch_for_changes = true,

            view_options = {
                show_hidden = false,
                is_hidden_file = function(name, _)
                    return vim.startswith(name, "..")
                end,

                highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
                    if entry.type == "directory" then
                        return "OilDir"
                    end
                end,

                case_insensitive = true,
            },

            win_options = {
                winbar = "%!v:lua.get_oil_winbar()",
            },
        })
    end,
    lazy = false,
}
