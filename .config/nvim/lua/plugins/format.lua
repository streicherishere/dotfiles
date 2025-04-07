return {
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					json = { "prettier" },
					markdown = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },

					tex = { "latexindent" },
					typst = { "typstfmt" },
					lua = { "stylua" },
					sh = { "beautysh" },
					terraform = { "terraform_fmt" },
					yaml = { "prettier" },
					python = { "autopep8", "ruff" },
					go = { "goimports", "gofmt" },
					html = { "djlint" },
					htmldjango = { "djlint" },
				},

				--				format_on_save = {
				--					lsb_fallback = true,
				--					async = false,
				--					timeout_ms = 500,
				--				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>tf", function()
				conform.format({
					lsb_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "Format file of range in (in visual mode)" })
		end,
	},
}
