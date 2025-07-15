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

			lint.linters.ruff.args = { "--src", vim.fn.getcwd() }
			-- Debuggen: Wrapper für ansible_lint, um Diagnosen zu inspizieren
			-- 			lint.linters.ansible_lint = require("lint.util").wrap(lint.linters.ansible_lint, function(diagnostic)
			-- 				-- Zeige die Diagnose in der Konsole zum Debuggen
			-- 				print("ansible_lint diagnostic:")
			-- 				print(vim.inspect(diagnostic)) -- Zeigt die vollständige Diagnose in der Konsole an
			--
			-- 				-- Optional: Modifiziere die Schwere, falls nötig
			-- 				diagnostic.severity = vim.diagnostic.severity.WARN -- Beispiel: ändere Schwere der Diagnose

			-- 				return diagnostic
			-- 			end)

			lint.linters_by_ft = {
				markdown = { "codespell" },
				dockerfile = { "hadolint" },
				go = { "golangcilint" },
				-- lua = { "selene" },
				sh = { "shellcheck" },
				yaml = { "yamllint" },
				["yaml.ansible"] = { "ansible_lint" },
				terraform = { "tfsec", "tflint" },
				python = { "ruff" },
				htmldjango = { "djlint" },
				html = { "djlint" },
        text = { "codespell" },
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
