-- INFO: terminal iside neovim
return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<c-j>]], -- Your custom keybinding here
				direction = "float", -- Terminal in float mode
				float_opts = {
					border = "single", -- Border style
					width = 150, -- Width of the floating window
					height = 45, -- Height of the floating window
					winblend = 0, -- Transparency
					highlights = {
						border = "Normal", -- Border highlight
						background = "Normal", -- Background highlight
					},
				},
			})
			if vim.g.neovide then
				-- For macOS (Command+V in terminal)
				vim.keymap.set("t", "<D-v>", "<C-\\><C-n>pi", { noremap = true, silent = true })

				-- For Linux/Windows (Ctrl+Shift+V in terminal)
				vim.keymap.set("t", "<C-S-v>", "<C-\\><C-n>pi", { noremap = true, silent = true })
			end

			vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
			vim.keymap.set("t", "oo", [[<C-\><C-n>]], { noremap = true, silent = true })
		end,
	},
}
