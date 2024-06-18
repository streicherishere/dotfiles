return {
  {
    "linrongbin16/gitlinker.nvim",
    keys = {
      { "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>gb", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link in browser" },
    },
    cmd = "GitLink",
    opts = function()
      return {
        router = {
          browse = {
            ["^gitlab%.in2code%.de"] = require("gitlinker.routers").gitlab_browse,
          },
          blame = {
            ["^gitlab%.in2code%.de"] = require("gitlinker.routers").gitlab_blame,
          },
        },
      }
    end,
  },
}
