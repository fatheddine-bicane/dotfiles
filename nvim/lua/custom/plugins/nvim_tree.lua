-- INFO: the tree
--
--
return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons", -- Icon support for file types
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 35, -- Width of the file explorer
					relativenumber = true, -- Show relative line numbers
				},
				renderer = {
					indent_markers = {
						enable = true, -- Enable folder indent markers
					},
					icons = {
						show = {
							file = true, -- Show icons for files
							folder = true, -- Show icons for folders
							folder_arrow = true, -- Show arrows for open/closed folders
							git = true, -- Show git icons (like changes)
						},
						glyphs = {
							default = "", -- Default icon for unknown file types
							symlink = "", -- Symlink icon
							git = {
								unstaged = "✗",
								staged = "✓",
								unmerged = "",
								renamed = "➜",
								untracked = "★",
								deleted = "",
								ignored = "◌",
							},
							folder = {
								arrow_closed = "", -- Closed folder icon
								arrow_open = "", -- Open folder icon
								default = "", -- Default folder icon
								open = "", -- Open folder icon
								empty = "", -- Empty folder icon
								empty_open = "", -- Open empty folder icon
								symlink = "", -- Symlinked folder icon
							},
						},
					},
				},
			})
			-- Keymaps
			local keymap = vim.keymap -- for conciseness

			keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
			keymap.set(
				"n",
				"<leader>ef",
				"<cmd>NvimTreeFindFileToggle<CR>",
				{ desc = "Toggle file explorer on current file" }
			) -- toggle file explorer on current file
			keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
			keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
			keymap.set("n", "<C-CR>", function()
				local node = require("nvim-tree.api").tree.get_node_under_cursor()
				if node and node.absolute_path then
					vim.cmd("wincmd l") -- Move to the main window
					vim.cmd("vsplit " .. vim.fn.fnameescape(node.absolute_path)) -- Open the selected file in vsplit
					vim.cmd("wincmd l") -- Move cursor to the new window
				end
			end, { desc = "Open file in vertical split on the right", buffer = true }) -- open selected file in vertical split on the right side and move cursor there
		end,
	},
}
