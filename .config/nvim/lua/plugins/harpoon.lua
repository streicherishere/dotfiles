return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    enabled = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon Add",
      },
      {
        "<M-e>",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Menu",
      },
      {
        "<M-h>",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon Select 1",
      },
      {
        "<M-j>",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon Select 2",
      },
      {
        "<M-k>",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon Select 3",
      },
      {
        "<M-l>",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Harpoon Select 4",
      },
      {
        "<C-S-P>",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Harpoon Prev",
      },
      {
        "<C-S-N>",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Harpoon Next",
      },
    },
    config = true,
  },
}
