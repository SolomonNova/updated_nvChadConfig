return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- ADD THIS SECTION BELOW:
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require "cmp"
      local conf = require "nvchad.configs.cmp" -- This pulls NvChad's default UI/settings

      -- Override the mappings
      conf.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          -- This forces the highlighted item to be SELECTED/CONFIRMED
          cmp.confirm { select = true }
        else
          fallback()
        end
      end, { "i", "s" })

      conf.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" })

      return conf
    end,
  },
}
