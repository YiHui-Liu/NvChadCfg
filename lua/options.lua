require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- Basic
--- Line
o.number = true
o.relativenumber = true
o.wrap = false

--- Tab
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

--- Clipboard
o.clipboard = "unnamedplus"
