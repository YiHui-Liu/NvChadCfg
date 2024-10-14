-- UI Configurations
return {
    --- Nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            filters = {
                git_ignored = false,
                custom = { 'node_modules', '.git', '.cache' },
            }
        },
    },
}
