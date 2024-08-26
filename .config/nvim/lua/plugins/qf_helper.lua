return {
	{
		"stevearc/qf_helper.nvim",
		config = function()
			local config = require("qf_helper").setup({
				prefer_loclist = true, -- Used for QNext/QPrev (see Commands below)
				sort_lsp_diagnostics = true, -- Sort LSP diagnostic results
				quickfix = {
					autoclose = true, -- Autoclose qf if it's the only open window
					default_bindings = true, -- Set up recommended bindings in qf window
					default_options = true, -- Set recommended buffer and window options
					max_height = 10, -- Max qf height when using open() or toggle()
					min_height = 1, -- Min qf height when using open() or toggle()
					track_location = true, -- Keep qf updated with your current location
				},
				loclist = { -- The same options, but for the loclist
					autoclose = true,
					default_bindings = true,
					default_options = true,
					max_height = 10,
					min_height = 1,
					track_location = true,
				},
			})
			vim.keymap.set("n", "]q", "<CMD>QNext<CR>", { silent = true })
			vim.keymap.set("n", "[q", "<CMD>QPrev<CR>", { silent = true })
			-- toggle the quickfix open/closed without jumping to it
			vim.keymap.set("n", "<leader>q", "<CMD>QFToggle!<CR>")
			vim.keymap.set("n", "<leader>l", "<CMD>LLToggle!<CR>")
		end,
		-- use <C-N> and <C-P> for next/prev.
	},
}
