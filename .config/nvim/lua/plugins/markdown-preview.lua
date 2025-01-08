return {
	{
		"instant-markdown/vim-instant-markdown",
		config = function()
			-- Disable auto-start of InstantMarkdown
			vim.g.instant_markdown_autostart = 0
		end,
	},
}
