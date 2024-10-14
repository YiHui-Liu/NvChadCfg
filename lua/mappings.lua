require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

-- NvChad Default
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Basic Operations
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>",    { desc = "save file" })
map({ "n", "i", "v" }, "<C-z>", "<cmd> undo <cr>", { desc = "history undo" })
map({ "n", "i", "v" }, "<C-y>", "<cmd> redo <cr>", { desc = "history redo" })

--- comment toggle
map("n", "<C-_>", "gcc",        { desc = "comment toggle", remap = true })
map("i", "<C-_>", "<Esc>gcc^i", { desc = "comment toggle", remap = true })
map("v", "<C-_>", "gc",         { desc = "comment toggle", remap = true })

--- Copy, paste and rename
map({ "n", "i", "v" }, "<C-c>", "\"+y", { desc = "copy seleted" })
map({ "n", "i", "v" }, "<C-v>", "\"+p", { desc = "paste" })
map({ "n", "i", "v" }, "<F2>", function()
  if vim.bo.filetype == "NvimTree" then
    require("nvim-tree.api").fs.rename()
  else
    require "nvchad.lsp.renamer"()
  end
end, { desc = "Rename" })

--- Disable Arrow Keys
map({ "n", "i", "v" }, "<Left>", "<Nop>")
map({ "n", "i", "v" }, "<Right>", "<Nop>")
map({ "n", "i", "v" }, "<Up>", "<Nop>")
map({ "n", "i", "v" }, "<Down>", "<Nop>")

-- LSP
map({ "n", "i", "v" }, "<F12>", vim.lsp.buf.definition, { desc = "LSP go to definition" })

-- FzfLua
map("n", "<leader>f/", "<cmd>FzfLua <cr>",               { desc = "FzfLua self" })
map("n", "<leader>ff", "<cmd>FzfLua files<cr>",          { desc = "FzfLua find files in project" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>",        { desc = "FzfLua find files in buffer" })
map("n", "<leader>fl", "<cmd>FzfLua live_grep<cr>",      { desc = "FzfLua search in project" })
map("n", "<leader>fg", "<cmd>FzfLua lgrep_curbuf<cr>",   { desc = "FzfLua search in current file" })
map("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>",     { desc = "FzfLua search word under cursor" })
map("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>",      { desc = "FzfLua list help tags" })
map("n", "<leader>fm", "<cmd>FzfLua marks<cr>",          { desc = "FzfLua list marks"})
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>",       { desc = "FzfLua list file history" })
map("n", "<leader>fq", "<cmd>FzfLua lgrep_quickfix<cr>", { desc = "FzfLua list quick fix" })
map("n", "<leader>fk", "<cmd>FzfLua keymaps<cr>",        { desc = "FzfLua list keymaps" })
map("n", "<leader>fc", "<cmd>FzfLua commands<cr>",       { desc = "FzfLua list neovim commands" })
map("n", "<leader>gf", "<cmd>FzfLua git_files<cr>",      { desc = "FzfLua list git files" })
map("n", "<leader>gs", "<cmd>FzfLua git_status<cr>",     { desc = "FzfLua show git status" })
map("n", "<leader>gc", "<cmd>FzfLua git_commits<cr>",    { desc = "FzfLua list git commits"})
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

