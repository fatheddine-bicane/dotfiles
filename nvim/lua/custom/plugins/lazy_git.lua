--lazygit pluging manager
return {
	{
		"kdheepak/lazygit.nvim",
		-- optional: for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			-- Set keymaps for opening lazygit
			vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true, desc = "Open LazyGit" })

			-- Configure lazygit window
			vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
			vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
			vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } -- customize lazygit popup window border characters
			vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

			-- Configure lazygit command to use terminal colors
			vim.g.lazygit_use_custom_config_file_path = 0

			vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>:q<CR>", { noremap = true, silent = true })
		end,
	},
}
