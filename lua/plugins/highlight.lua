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
}
