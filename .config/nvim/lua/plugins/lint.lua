return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "<leader>l",
        function()
          require("lint").try_lint()
        end,
        desc = "Trigger linting",
      },
    },
    config = function()
      local lint = require("lint")

      lint.linters.ruff.args = { "--src", vim.fn.getcwd() }

      lint.linters_by_ft = {
        markdown = { "codespell" },
        dockerfile = { "hadolint" },
        go = { "golangcilint" },
        sh = { "shellcheck" },
        yaml = { "yamllint" },
        ["yaml.ansible"] = { "ansible_lint" },
        terraform = { "tfsec", "tflint" },
        python = { "ruff" },
        htmldjango = { "djlint" },
        html = { "djlint" },
        text = { "codespell" },
      }

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("lint", { clear = true }),
        callback = function()
          lint.try_lint()
        end,
      })

      vim.diagnostic.config({
        virtual_text = {
          spacing = 4,
          prefix = "●",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },
}
