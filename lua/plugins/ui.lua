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
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function()
            local notify = require("notify")
            -- :h notify.Config
            notify.setup({
                -- "fade", "slide", "fade_in_slide_out", "static"
                -- fade, slide, fade_in_slide_out, static
                stages = "fade_in_slide_out",
                -- ERROR > WARN > INFO > DEBUG > TRACE
                level = "TRACE",
                -- default minimal simple compact wrapped-compact wrapped-default
                render = "wrapped-compact",
                timeout = 2000,
                fps = 4,
                background_colour = "Normal",
                max_width = math.floor(vim.api.nvim_win_get_width(0) / 2),
                max_height = math.floor(vim.api.nvim_win_get_height(0) / 4),
            })

            vim.notify = notify
        end,
    },
    {
        "folke/noice.nvim",
        event = { "BufRead", "BufNewFile" },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        },
        opts = {
            messages = {
                enabled = true,
                view = "notify",
                view_error = "notify",
                view_warn = "notify",
                view_history = "messages",
                view_search = "virtualtext",
            },
            -- Close lsp loading progress bar
            lsp = {
                progress = {
                    enabled = false,
                },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
            health = {
                checker = false,
            },
            routes = {
                {
                    view = "vsplit",
                    filter = {
                        event = "msg_show",
                        min_height = 5
                    },
                },
            },
        },
    },
}
