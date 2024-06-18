return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd = "MasonToolsInstall",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "ansible-lint",
        "hadolint",
        "mypy",
        "ruff",
        "selene",
        "shellcheck",
        "shellharden",
        "tflint",
        "tfsec",
        "trivy",
        "stylua",
        "yamllint",
        "beautysh",
        "shfmt",
        "latexindent",
        "prettier",
        "black",
        "yamlfmt",
        "bash-debug-adapter",
        "ltex-ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ansiblels",
          "bashls",
          "html",
          "tflint",
          "terraformls",
          "yamlls",
          "pyright",
          "docker_compose_language_service",
          "dockerls",
          "marksman",
          "jinja_lsp",
          "ltex",
          "ruff",
        },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({ capabilities = capabilities })
          end,
          ["yamlls"] = function()
            lspconfig.yamlls.setup({
              capabilities = capabilities,
              settings = {
                yaml = {
                  schemas = {
                    kubernetes = "*.yaml",
                    ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                    ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                    ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks"] = "roles/tasks/*.{yml,yaml}",
                    ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                    ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                    ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] = "*play*.{yml,yaml}",
                    ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                    ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*.gitlab-ci.{yml,yaml}",
                    ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
                    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
                  },
                },
              },
            })
          end,
          ["ansiblels"] = function()
            lspconfig.ansiblels.setup({
              capabilities = capabilities,
              settings = {
                ansible = {
                  validation = {
                    lint = { enabled = false },
                  },
                },
              },
            })
          end,
          ["jinja_lsp"] = function()
            lspconfig.jinja_lsp.setup({
              capabilities = capabilities,
              filetypes = { "htmldjango" },
            })
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({ capabilities = capabilities })
          end,
          ["ltex"] = function()
            lspconfig.ltex.setup({
              capabilities = capabilities,
              settings = { ltex = { language = "en-GB" } },
            })
          end,
          ["ruff_lsp"] = function()
            lspconfig.ruff_lsp.setup({
              capabilities = capabilities,
              filetypes = { "python" },
            })
          end,
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }
          opts.desc = "Show LSP references"
          vim.keymap.set("n", "<leader>xr", "<cmd>FzfLua lsp_references<CR>", opts)
          opts.desc = "Smart rename"
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          opts.desc = "Show LSP definitions"
          vim.keymap.set("n", "<leader>ld", "<cmd>FzfLua lsp_definitions<CR>", opts)
          opts.desc = "Go to declaration"
          vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)
          opts.desc = "See available code actions"
          vim.keymap.set({ "n", "v" }, "ca", "<cmd>FzfLua lsp_code_actions<CR>", opts)
          opts.desc = "Show documentation for what is under cursor"
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          opts.desc = "Restart LSP"
          vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
          opts.desc = "Show LSP implementations"
          vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts)
          opts.desc = "Show LSP type definitions"
          vim.keymap.set("n", "gt", "<cmd>FzfLua lsp_typedefs<CR>", opts)
        end,
      })
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    },
  },
}
