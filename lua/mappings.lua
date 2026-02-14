require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";",  ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

--custom motions
map("n", "E", "g_", { desc = "End of line (last character)" })
map("n", "B", "^",  { desc = "Start of line (first non-whitespace)" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
