-- Tools
return {
    --- Fzf-lua
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "FzfLua",
        opts = {
            winopts = {
                preview = {
                    default = "bat",
                },
            },
            git = {
                grep = {
                    cmd = "rg --vimgrep"
                }
            }
        }
    },

    --- Github Copilot
    {
        "github/copilot.vim",
        lazy = false,
    },
}
