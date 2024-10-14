-- Language server protocol configuration
return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            require "configs.lsp"
        end,
    },

    --- close lazy load of Mason 
    {
        "williamboman/mason.nvim",
        lazy = false,
    },

    --- Typst
    {
        "kaarmu/typst.vim",
        ft = "typ"
    }
}
