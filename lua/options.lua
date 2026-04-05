require "nvchad.options"

-- add yours here!

vim.opt.expandtab = true   -- insert spaces instead of <Tab>
vim.opt.shiftwidth = 4    -- indentation width
vim.opt.tabstop = 4       -- visual width of a tab
vim.opt.softtabstop = 4   -- spaces inserted in insert mode

-- This tells Neovim that .ino files are C++ files
-- This is what triggers clangd (autocomplete) to start
vim.filetype.add({
  extension = {
    ino = "cpp",
  },
})
