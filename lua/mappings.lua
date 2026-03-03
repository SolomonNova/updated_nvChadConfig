require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";",  ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

--custom motions
map("n", "E", "g_", { desc = "End of line (last character)" })
map("n", "B", "^",  { desc = "Start of line (first non-whitespace)" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- =========================
-- Neovide zoom / scale maps
-- =========================
-- Works only when running inside Neovide (safely no-ops otherwise).
-- Adjust step/min/max to taste.

if vim.g.neovide then
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor or 1.0

  local min_scale, max_scale, step = 0.5, 3.0, 0.1

  local function set_neovide_scale(delta)
    local s = vim.g.neovide_scale_factor + delta
    s = math.max(min_scale, math.min(max_scale, s))
    vim.g.neovide_scale_factor = s
    -- brief feedback in Neovim
    vim.notify("Neovide scale: " .. string.format("%.2f", s), vim.log.levels.INFO)
  end

  -- keyboard zoom (normal mode)
  map("n", "<C-=>", function() set_neovide_scale(step) end, { desc = "Neovide: zoom in" })
  -- many keyboards send <C-+> when shift is used with =; map it too
  map("n", "<C-+>", function() set_neovide_scale(step) end, { desc = "Neovide: zoom in (alt)" })
  map("n", "<C-->", function() set_neovide_scale(-step) end, { desc = "Neovide: zoom out" })
  map("n", "<C-0>", function()
    vim.g.neovide_scale_factor = 1.0
    vim.notify("Neovide scale reset", vim.log.levels.INFO)
  end, { desc = "Neovide: reset zoom" })

  -- Ctrl + mouse wheel (works when mouse is enabled)
  map("n", "<C-ScrollWheelUp>", function() set_neovide_scale(step) end, { desc = "Neovide: mouse zoom in" })
  map("n", "<C-ScrollWheelDown>", function() set_neovide_scale(-step) end, { desc = "Neovide: mouse zoom out" })
end

-- optional: dynamic font-size switching instead of scaling (commented)
--[[
map("n", "<A-=>", function()
  -- increase font size by 1
  local f = vim.o.guifont or ""
  local fam, size = f:match("^(.-):h(%d+)$")
  if fam and size then
    size = tonumber(size) + 1
    vim.o.guifont = string.format("%s:h%d", fam, size)
    vim.notify("guifont -> " .. vim.o.guifont, vim.log.levels.INFO)
  end
end, { desc = "Increase guifont size (alt+=)" })
]]
