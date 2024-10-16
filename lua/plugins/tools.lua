---@type LazySpec
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
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {
            need = 2,
        }
    },
    {
        "mg979/vim-visual-multi",
        event = "BufReadPre",
        init = function()
            vim.g.VM_maps = {
                ["Find Under"] = "<C-d>"
            }
        end,
    }
}
