return {
	{
		"olimorris/persisted.nvim",
		lazy = false, -- make sure the plugin is always loaded at startup
		config = function()
			require("persisted").setup({
				autosave = true,
        autoload = false,
			})
		end,
	},
}
