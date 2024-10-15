---@type LazySpec
-- Highlighting
return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "lua",
                "html", "css", "javascript",
                "c", "cpp",
                "python",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = false,
    },
    {
        "hiphish/rainbow-delimiters.nvim",
        lazy = false,
        config = function()
            require "configs.highlight"
        end,
    },
}
