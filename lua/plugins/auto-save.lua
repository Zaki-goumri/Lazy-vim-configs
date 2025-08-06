return {
  "okuuva/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    enabled = true,
    execution_message = {
      message = function()
        return ""
      end,
    },
    trigger_events = { "InsertLeave", "TextChanged" },
    debounce_delay = 135,
    condition = function(buf)
      local fn = vim.fn
      local utils = require("auto-save.utils.data")

      if
        fn.getbufvar(buf, "&modifiable") == 1
        and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) -- you can exclude types here
      then
        return true
      end
      return false
    end,
  },
}
