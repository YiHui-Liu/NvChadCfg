require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

-- NvChad Default
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Basic Operations
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "save file" })
map({ "n", "i", "v" }, "<C-z>", "<cmd> undo <cr>", { desc = "history undo" })
map({ "n", "i", "v" }, "<C-y>", "<cmd> redo <cr>", { desc = "history redo" })

--- comment toggle
map("n", "<C-_>", "gcc", { desc = "comment toggle", remap = true })
map("i", "<C-_>", "<Esc>gcc^i", { desc = "comment toggle", remap = true })
map("v", "<C-_>", "gc", { desc = "comment toggle", remap = true })

--- Copy, paste and rename
map({ "n", "i", "v" }, "<C-c>", "\"+y", { desc = "copy selected" })
map({ "n", "i", "v" }, "<C-v>", "\"+p", { desc = "paste" })
map({ "n", "i", "v" }, "<F2>", function()
    if vim.bo.filetype == "NvimTree" then
        require("nvim-tree.api").fs.rename()
    else
        require "nvchad.lsp.renamer" ()
    end
end, { desc = "Rename" })

--- Wrap line
map({ "n", "i", "v" }, "<A-w>", function()
    if string.find(vim.bo.formatoptions, "t") == nil then
        vim.cmd "set wrap"
        vim.cmd "set fo+=tc"
    else
        vim.cmd "set nowrap"
        vim.cmd "set fo-=tc"
    end
end, { desc = "wrap line" })

--- Disable Arrow Keys
-- map({ "n", "i", "v" }, "<Left>", "<Nop>")
-- map({ "n", "i", "v" }, "<Right>", "<Nop>")
-- map({ "n", "i", "v" }, "<Up>", "<Nop>")
-- map({ "n", "i", "v" }, "<Down>", "<Nop>")

-- LSP
map("n", "gh", vim.lsp.buf.hover, { desc = "LSP hover doc" })
map("n", "ge", vim.diagnostic.open_float, { desc = "LSP show diagnostic" })
map("n", "<A-F>", vim.lsp.buf.format, { desc = "LSP format" })
map({ "n", "i", "v" }, "<A-.>", vim.lsp.buf.code_action, { desc = "LSP code action" })
map({ "n", "i", "v" }, "<F12>", vim.lsp.buf.definition, { desc = "LSP go to definition" })

-- FzfLua
map("n", "<leader>f/", "<cmd>FzfLua <cr>", { desc = "FzfLua self" })
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "FzfLua find files in project" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "FzfLua find files in buffer" })
map("n", "<leader>fl", "<cmd>FzfLua live_grep<cr>", { desc = "FzfLua search in project" })
map("n", "<leader>fg", "<cmd>FzfLua lgrep_curbuf<cr>", { desc = "FzfLua search in current file" })
map("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>", { desc = "FzfLua search word under cursor" })
map("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>", { desc = "FzfLua list help tags" })
map("n", "<leader>fm", "<cmd>FzfLua marks<cr>", { desc = "FzfLua list marks" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>", { desc = "FzfLua list file history" })
map("n", "<leader>fq", "<cmd>FzfLua lgrep_quickfix<cr>", { desc = "FzfLua list quick fix" })
map("n", "<leader>fk", "<cmd>FzfLua keymaps<cr>", { desc = "FzfLua list keymaps" })
map("n", "<leader>fc", "<cmd>FzfLua commands<cr>", { desc = "FzfLua list neovim commands" })
map("n", "<leader>gf", "<cmd>FzfLua git_files<cr>", { desc = "FzfLua list git files" })
map("n", "<leader>gs", "<cmd>FzfLua git_status<cr>", { desc = "FzfLua show git status" })
map("n", "<leader>gc", "<cmd>FzfLua git_commits<cr>", { desc = "FzfLua list git commits" })
map("n", "<leader>th", function()
    require("nvchad.themes").open()
end, { desc = "FzfLua list nvchad themes" })

map({ "n", "i", "v" }, "<C-f>", function()
    vim.cmd "FzfLua lgrep_curbuf"
end, { desc = "FzfLua search in current buffer" })
map({ "n", "i", "v" }, "<A-f>", function()
    vim.cmd "FzfLua live_grep"
end, { desc = "FzfLua search in current project" })

-- Comment telescope hotkeys
unmap("n", "<leader>fa")
unmap("n", "<leader>fz")
unmap("n", "<leader>cm")
unmap("n", "<leader>gt")
unmap("n", "<leader>pt")
unmap("n", "<leader>ma")

-- persistence
local ps = require("persistence")
map("n", "<leader>ps", function() ps.load() end, { desc = "Persistence load session" })
map("n", "<leader>pS", function() ps.select() end, { desc = "Persistence select session" })
map("n", "<leader>pl", function() ps.load({ last = true }) end, { desc = "Persistence load last session" })

-- Notify & Noice
map("n", "<leader>on", ":Notifications<cr>", { desc = "Noice show notifications" })
map("n", "<leader>om", ":messages<cr>", { desc = "Notify show messages" })
map("n", "<leader>of", ":Noice fzf<cr>", { desc = "Notify search with fzf" })
map("n", "<leader>od", ":NoiceDisable<cr>", { desc = "Notify disable" })
map("n", "<leader>oo", ":NoiceEnable<cr>", { desc = "Notify enable" })

-- Trouble
map("n", "<C-t>", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble diagnostics" })
map("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble diagnostics" })
map("n", "<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Trouble buffer diagnostics" })
map("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Trouble symbols" })
map("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>", { desc = "Trouble show quickfix" })
map("n", "<leader>tl", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble show loclist" })
map("n", "<leader>tr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "Trouble show lsp references" })

