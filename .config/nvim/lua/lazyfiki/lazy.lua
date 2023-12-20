local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "rose-pine/neovim", name = "rose-pine",
        priority = 1000,
        config = function()
            require("rose-pine").setup{
                disable_background = true
            }

            color = color or "rose-pine"
            vim.cmd.colorscheme(color)
            vim.opt.termguicolors = true

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    { "nvim-treesitter/nvim-treesitter-context" },
    { "theprimeagen/harpoon" },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    {'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
    { "folke/trouble.nvim", opts = {
        icons = false,
        signs = {
            error = "E",
            warning = "W",
            hint = "H",
            information = "I",
            other = "O",
        },
        fold_open = "v",
        fold_closed = ">",
    }},

    { "ThePrimeagen/vim-be-good", cmd = "VimBeGood"},
    { "norcalli/nvim-colorizer.lua" },

    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip', event = "InsertEnter"},
})
