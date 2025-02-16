return {
	--kanagawa dragon theme
	{
		"rebelot/kanagawa.nvim",
		config = function()
			-- Apply the colorscheme first
			vim.cmd.colorscheme("kanagawa-dragon")

			-- Set pure black background
			vim.cmd("highlight Normal guibg=#000000")

			-- Change the line number color
			vim.api.nvim_set_hl(0, "LineNr", {
				fg = "#d1cda8", -- Light beige color for line numbers
				bg = "#000000", -- Pure black background
			})

			-- Change NvimTree folder icon color
			vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", {
				fg = "#d1cda8", -- Light beige color for folder icons
			})
		end,
	},
}
