---@type LazySpec
-- Auto completion plugin
local cmp = require 'cmp'

return {
    {
        "hrsh7th/nvim-cmp",
        opts = {
            mapping = cmp.mapping.preset.insert({
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<A-.>'] = cmp.mapping.complete(),
                ['<A-,>'] = cmp.mapping.abort(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            })
        }
    },
    --- Github Copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = {
                auto_trigger = true,
            },
        },
    },
}
