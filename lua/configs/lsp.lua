local lspconfig = require "lspconfig"
local mr = require "mason-registry"

local nvlsp = require "nvchad.configs.lspconfig"

local default_opts = {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
}

local lua_config = function()
    dofile(vim.g.base46_cache .. "lsp")
    require("nvchad.lsp").diagnostic_config()

    local settings = {
        Lua = {
            workspace = {
                maxPreload = 1000000,
                preloadFileSize = 10000,
            },
        },
    }

    -- If current working directory is Neovim config directory
    local in_neovim_config_dir = (function()
        local stdpath_config = vim.fn.stdpath "config"
        local config_dirs = type(stdpath_config) == "string" and { stdpath_config } or stdpath_config
        ---@diagnostic disable-next-line: param-type-mismatch
        for _, dir in ipairs(config_dirs) do
            if vim.fn.getcwd():find(dir, 1, true) then
                return true
            end
        end
    end)()

    if in_neovim_config_dir then
        -- Add vim to globals for type hinting
        settings.Lua.diagnostic = settings.Lua.diagnostic or {}
        settings.Lua.diagnostic.globals = settings.Lua.diagnostic.globals or {}
        table.insert(settings.Lua.diagnostic.globals, "vim")

        -- Add all plugins installed with lazy.nvim to `workspace.library` for type hinting
        settings.Lua.workspace.library = vim.list_extend({
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
            "${3rd}/busted/library", -- Unit testing
            "${3rd}/luassert/library", -- Unit testing
            "${3rd}/luv/library",    -- libuv bindings (`vim.uv`)
        }, vim.fn.glob(vim.fn.stdpath "data" .. "/lazy/*", true, true))
    end

    ---@diagnostic disable-next-line: undefined-field
    lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", default_opts, {
        settings = settings,
    }))
end

---@type MasonLspconfigSettings
local options = {
    ---@diagnostic disable-next-line: undefined-field
    handlers = {
        function(server_name)
            lspconfig[server_name].setup(default_opts)
        end,

        lua_ls = lua_config,
    },

    ensure_installed = {
        "lua_ls"
    }
}

return options
