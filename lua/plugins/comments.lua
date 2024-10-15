---@type LazySpec
-- Code comments
return {
    {
        "folke/todo-comments.nvim",
        lazy = false,
        dependencies = "nvim-lua/plenary.nvim",
        opts = {},
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "BufRead",
        opts = {
            enable_autocmd = false,
        },
        config = function()
            local get_option = vim.filetype.get_option
            vim.filetype.get_option = function(filetype, option)
                return option == "commentstring"
                    and require("ts_context_commentstring.internal").calculate_commentstring()
                    or get_option(filetype, option)
            end
        end,
    }
}
