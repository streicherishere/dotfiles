return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "antosha417/nvim-lsp-file-operations",
  },
  keys = {
    { "<leader>n", "<cmd>Neotree toggle filesystem reveal left<CR>", desc = "Toggle NeoTree" },
    { "<leader>bf", "<cmd>Neotree buffers reveal float<CR>", desc = "NeoTree Buffers" },
  },
  opts = {
    filesystem = {
      filtered_items = {
        follow_current_file = { enabled = true },
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          -- '.git',
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        never_show = { ".git" },
      },
    },
  },
}
