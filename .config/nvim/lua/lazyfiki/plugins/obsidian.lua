return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- Use the latest release
    lazy = false,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/personal/vault/",
            },
        },
        note_id_func = function(title)
            if title ~= nil then
                return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                return tostring(os.time())
            end
        end,
        note_path_func = function(spec)
            local path = spec.dir / tostring(spec.title)
            return path:with_suffix(".md")
        end,
        disable_frontmatter = true,

        ui = {
          enable = false,  -- Enable UI module to allow reference_text rendering
        },
    },
}
