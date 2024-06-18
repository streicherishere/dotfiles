return {
	{
		"pearofducks/ansible-vim",
		config = function() end,
	},
	{
		"takelley1/ansible-doc.vim",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>d", ":AnsibleDocFloat<CR>", { silent = true })
			vim.api.nvim_set_keymap("n", "<leader>v", ":AnsibleDocVSplit<CR>", { silent = true })
		end,
	},
}
