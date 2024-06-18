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

			lint.linter_by_ft = {
				markdown = { "vale" },
				dockerfile = { "hadolint" },
				go = { "golangcilint" },
				lua = { "selene", "luacheck" },
				sh = { "shellcheck" },
				yaml = { "yamllint" },
				ansible = { "ansiblelint" },
				terraform = { "tfsec", "tflint" },
				python = { "pylint", "mypy", "ruff" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				pattern = { "*.tf", "*.py", "*.sh", "*.yaml", "*.yml" },
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
