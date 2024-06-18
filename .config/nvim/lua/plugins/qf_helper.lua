return {
  {
    "stevearc/qf_helper.nvim",
    keys = {
      { "<C-]>", "<CMD>QNext<CR>", desc = "Quickfix Next" },
      { "<C-[>", "<CMD>QPrev<CR>", desc = "Quickfix Prev" },
      { "<leader>q", "<CMD>QFToggle!<CR>", desc = "Quickfix Toggle" },
      { "<leader>l", "<CMD>LLToggle!<CR>", desc = "Location List Toggle" },
    },
    opts = {
      prefer_loclist = true,
      sort_lsp_diagnostics = true,
      quickfix = {
        autoclose = true,
        default_bindings = true,
        default_options = true,
        max_height = 10,
        min_height = 1,
        track_location = true,
      },
      loclist = {
        autoclose = true,
        default_bindings = true,
        default_options = true,
        max_height = 10,
        min_height = 1,
        track_location = true,
      },
    },
  },
}
