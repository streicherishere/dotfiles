return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Navigate Left (Tmux)" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Navigate Down (Tmux)" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Navigate Up (Tmux)" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Navigate Right (Tmux)" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Navigate Previous (Tmux)" },
  },
}