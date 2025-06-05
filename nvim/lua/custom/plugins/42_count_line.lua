-- INFO: pligin for the 42 that counts the function line
return {
	{
		"FtVim/ft_count_lines.nvim",
		config = function()
			require("ft_count_lines").setup({
				enable_on_start = false, -- Enable the count lines feature at startup
				keybinding = "<leader>cl", -- Keybinding to toggle the feature
			})
		end,
	},
}
