---@type LazySpec
-- Language server protocol configuration
return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
    },

    --- close lazy load of Mason
    {
        "williamboman/mason.nvim",
        lazy = false,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = function()
            return require "configs.lsp"
        end,
    },

    --- Typst
    {
        "kaarmu/typst.vim",
        ft = "typ"
    },

    {
        "folke/trouble.nvim",
        event = "BufRead",
        cmd = { "Trouble" },
        opts = {},
    },
}
