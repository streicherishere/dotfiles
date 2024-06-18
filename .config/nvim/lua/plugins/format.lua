return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>tf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = { "n", "v" },
        desc = "Format file or range (visual)",
      },
    },
    opts = {
      formatters = {
        prettier = {
          prepend_args = { "--no-use-tabs" },
        },
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
      },
      formatters_by_ft = {
        javascript = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier", "djlint" },
        css = { "prettier" },
        tex = { "latexindent" },
        typst = { "typstfmt" },
        lua = { "stylua" },
        sh = { "beautysh" },
        terraform = { "terraform_fmt" },
        yaml = { "prettier" },
        python = { "autopep8", "ruff" },
        go = { "goimports", "gofmt" },
        htmldjango = { "djlint" },
      },
      -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },
  },
}
