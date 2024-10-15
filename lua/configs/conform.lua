local conform = require "conform"

local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        -- Script
        bash = { "shellcheck", "shfmt" },
        -- Dev
        c = { "clang-format", lsp_format = "last" },
        cpp = { "clang-format", lsp_format = "last" },
        python = function(bufnr)
            if conform.get_formatter_info("ruff_format", bufnr).available then
                return { "ruff_format" }
            else
                return { "isort", "black" }
            end
        end,
        -- Web
        css = { "stylelint", "prettierd" },
        html = { "prettierd" },
        javascript = { "stylelint", "prettierd", "eslint_d" },
    },

    format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
    },
}

return options
