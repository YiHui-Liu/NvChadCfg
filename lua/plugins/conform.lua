---@type LazySpec
-- Conform
return   {
    "stevearc/conform.nvim",
    lazy = false,
    opts = function ()
        require "configs.conform"
    end,
}
