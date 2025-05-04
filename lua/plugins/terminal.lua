return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    opts = {
      open_mapping = [[<c-\>]],
      direction = "vertical", -- This makes it open as a side panel
      size = function(term)
        if term.direction == "vertical" then
          return vim.o.columns * 0.4 -- 40% of screen width
        end
        return 20 -- Height for horizontal terminals
      end,
    },
    keys = {
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Terminal Vertical" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal Horizontal" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal Float" },
    },
  },
}
