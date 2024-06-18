return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  build = "make",
  opts = {
    provider = "gemini-cli",
    acp_providers = {
      ["gemini-cli"] = {
        command = "/usr/bin/gemini",
        args = { "" },
        env = {
          NODE_NO_WARNINGS = "1",
        },
      },
    },
    instructions_file = "avante.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "stevearc/dressing.nvim",
    "ibhagwan/fzf-lua",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = { file_types = { "markdown", "Avante" } },
      ft = { "markdown", "Avante" },
    },
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
          use_absolute_path = true,
        },
      },
    },
  },
}
