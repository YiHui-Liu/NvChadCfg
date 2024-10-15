---@type LazySpec
-- UI Configurations
return {
    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            filters = {
                git_ignored = false,
                custom = { 'node_modules', '.git', '.cache' },
            }
        },
    },
    {
        "Bekaboo/dropbar.nvim",
        lazy = false,
    },
}
