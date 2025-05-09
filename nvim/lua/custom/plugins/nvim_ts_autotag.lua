-- INFO: Automatically closes and completes HTML/XML/JSX tags while editing, with support for self-closing tags (e.g., <img />)
--
return {
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}
