return {
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufreadPre",
			"BufNewFile",
			"BufEnter",
		},
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				markdown = { "markdownlint" },
				dockerfile = { "hadolint" },
				go = { "golangcilint" },
				-- lua = { "selene" },
				sh = { "shellcheck" },
				yaml = { "yamllint" },
				ansible = { "ansible_lint" },
				terraform = { "tfsec", "tflint" },
				python = { "ruff" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				-- pattern = { "*.tf", "*.py", "*.sh", "*.yaml", "*.yml" "},
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>l", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},
}
