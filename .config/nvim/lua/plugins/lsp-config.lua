return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
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
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- linter
					"ansible-lint", -- ansible
					"hadolint", -- dockerfile
					"mypy", -- python
					"ruff", -- python
					"selene", -- lua
					"shellcheck", -- bash
					"shellharden", -- bash
					"tflint", -- terraform
					"tfsec", -- terraform
					"trivy", -- a lot
					"stylua", -- lua
					"yamllint", -- yaml
					-- formatter
					"beautysh", -- bash
					"shfmt", -- bash
					"latexindent", -- latex
					"prettier", -- yaml,json
					"ruff", -- python
					"black", -- python
					"shellharden", -- bash
					"stylua", -- lua
					"yamlfmt", -- yaml
					-- # dap
					"bash-debug-adapter", -- bash
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.html.setup({
				capabilites = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilites = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.ansiblels.setup({
				capabilities = capabilities,
			})
			lspconfig.tflint.setup({
				capabilities = capabilities,
			})
			lspconfig.terraformls.setup({
				capabilities = capabilities,
			})
			lspconfig.yamlls.setup({
				capabilities = capabilities,
				settings = {
					yaml = {
						schemas = {
							-- https://www.schemastore.org/json/
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
			lspconfig.pyright.setup({
				capabilities = capabilities,
				filetypes = { "python" },
			})
			lspconfig.ruff.setup({
				capabilities = capabilities,
				filetypes = { "python" },
			})
			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
			})
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			local opts = { noremap = true, silent = true }

			-- set keybinds
			opts.desc = "Show LSP references"
			vim.keymap.set("n", "<leader>xr", "<cmd>FzfLua lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show LSP definitions"
			vim.keymap.set("n", "<leader>ld", "<cmd>FzfLua lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Go to declaration"
			vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "See available code actions"
			vim.keymap.set({ "n", "v" }, "ca", "<cmd>FzfLua lsp_code_actions<CR>", opts) -- show  See available code actions

			opts.desc = "Show documentation for what is under cursor"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

			-- not so important
			opts.desc = "Show LSP implementations"
			vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			vim.keymap.set("n", "gt", "<cmd>FzfLua lsp_typedefs<CR>", opts) -- show lsp type definitions
		end,
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	--	{
	--		"folke/trouble.nvim",
	--		dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	--    cmd = "Trouble",
	--		keys = {
	--			{ "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" },
	--			{
	--				"<leader>xw",
	--				"<cmd>TroubleToggle workspace_diagnostics<CR>",
	--				desc = "Open trouble workspace diagnostics",
	--			},
	--			{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
	--			{ "<leader>xq", "<cmd>TroubleTogglequickfix<CR>", desc = "Open trouble quickfix list" },
	--			{ "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
	--			{
	--				"]n",
	--				"<cmd>lua require('trouble').next({skip_groups = true, jump = true})<CR>",
	--				desc = "jump",
	--			},
	--			{
	--				"[n",
	--				"<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<CR>",
	--				desc = "jump",
	--			},
	--
	--			{ "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
	--		},
	--	},
}
