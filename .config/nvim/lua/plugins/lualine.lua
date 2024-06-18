return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local lazy_status = require("lazy.status")
    return {
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    }
  end,
}
