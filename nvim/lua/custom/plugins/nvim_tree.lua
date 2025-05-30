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
			--
			--
			--
			-- tmux
			require("nvim-tree").setup({
				on_attach = function(bufnr)
					local api = require("nvim-tree.api")

					-- Load default mappings first
					api.config.mappings.default_on_attach(bufnr)

					-- Helper function for keymap options
					local function opts(desc)
						return {
							desc = "nvim-tree: " .. desc,
							buffer = bufnr,
							noremap = true,
							silent = true,
							nowait = true,
						}
					end

					-- Override with tmux navigation
					vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", opts("Tmux Navigate Left"))
					vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", opts("Tmux Navigate Right"))
					vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", opts("Tmux Navigate Down"))
					vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", opts("Tmux Navigate Up"))
				end,
			})
			--
			--
			--
		end,
	},
}
