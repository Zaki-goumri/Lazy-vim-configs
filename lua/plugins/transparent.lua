return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "goolord/alpha-nvim",
    config = function()
      -- Change dashboard header text color
      vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#7aa2f7", bg = "none" }) -- blue
      -- Change dashboard buttons color
      vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#9ece6a", bg = "none" }) -- green
      -- Change dashboard footer color
      vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#bb9af7", bg = "none" }) -- purple
    end,
  },
}
