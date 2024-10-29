return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({
			keymap = {
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},
		})

		function live_grep_in_selected_directory(selected_directory)
			require("fzf-lua").live_grep({
				cwd = selected_directory,
				cmd = "rg --hidden --line-number --column --color=always --glob '!{.git,node_modules}/*'",
			})
		end

		function select_directory_and_live_grep()
			require("fzf-lua").fzf_exec("find ~/work/projects -type d -maxdepth 2", {
				actions = {
					["default"] = function(selected)
						if selected and #selected > 0 then
							local selected_directory = vim.fn.trim(selected[1])
							live_grep_in_selected_directory(selected_directory)
						else
							print("Kein Verzeichnis ausgewählt.")
						end
					end,
				},
			})
		end

		function files_in_selected_directory(selected_directory)
			require("fzf-lua").git_files({ cwd = selected_directory })
		end

		function select_directory_and_files()
			require("fzf-lua").fzf_exec("find ~/work/projects -type d -maxdepth 2", {
				actions = {
					["default"] = function(selected)
						if selected and #selected > 0 then
							local selected_directory = vim.fn.trim(selected[1])
							files_in_selected_directory(selected_directory)
						else
							print("Kein Verzeichnis ausgewählt.")
						end
					end,
				},
			})
		end

		vim.api.nvim_set_keymap("n", "<leader>0", ":FzfLua command_history<CR>", { noremap = true, silent = true })

		vim.api.nvim_set_keymap("n", "<C-x>", ":FzfLua changes<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-z>", ":FzfLua jumps<CR>", { noremap = true, silent = true })

		vim.api.nvim_set_keymap("n", "<C-t>", ":FzfLua files<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-f>", ":FzfLua lgrep_curbuf<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap(
			"n",
			"<c-k>",
			"<cmd>lua require('fzf-lua').keymaps({ previewer = true })<CR>",
			{ noremap = true, silent = true }
		)

		vim.api.nvim_set_keymap(
			"n",
			"<C-g>",
			'<cmd>lua require"fzf-lua".live_grep({ cmd = "git grep --line-number --column --color=always" })<CR>',
			{}
		)
		vim.api.nvim_set_keymap(
			"n",
			"<C-y>",
			[[<cmd>lua require'fzf-lua'.live_grep({ cmd = "rg --hidden --line-number --column --color=always --glob '!{.git,node_modules}/*'" })<CR>]],
			{}
		)

		vim.api.nvim_set_keymap(
			"n",
			"<leader>ff",
			"<cmd>lua select_directory_and_live_grep()<CR>",
			{ noremap = true, silent = true }
		)

		vim.api.nvim_set_keymap(
			"n",
			"<leader>fp",
			"<cmd>lua select_directory_and_files()<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
