return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "terraform", "yaml", "bash", "dockerfile", "json", "ssh_config"},
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
