-- INFO: the tree
--
--
return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local keymap = vim.keymap

			--
			--
			--
			--
			--Renames a file in the file tree, using git mv if the file is tracked by Git,
			--or a normal rename if not, then refreshes the tree view.
			local function git_aware_rename(node)
				local old_path = node.absolute_path
				local old_name = node.name
				local input = vim.fn.input("Rename to: ", old_name)
				if input == "" or input == old_name then
					return
				end
				local new_path = node.parent.absolute_path .. "/" .. input
				local is_git = vim.fn.systemlist("git rev-parse --is-inside-work-tree")[1] == "true"
				if is_git then
					-- Check if the file is tracked by git
					local tracked = vim.fn.systemlist('git ls-files --error-unmatch "' .. old_path .. '" 2>&1')
					if vim.v.shell_error == 0 then
						-- File is tracked, use git mv
						vim.cmd(string.format('silent !git mv "%s" "%s"', old_path, new_path))
					else
						-- File not tracked, rename normally
						vim.loop.fs_rename(old_path, new_path)
					end
				else
					-- Not a git repo, rename normally
					vim.loop.fs_rename(old_path, new_path)
				end
				require("nvim-tree.api").tree.reload()
			end
			--
			--
			--
			--
			--
			--
			-- 🔑 Global keymaps
			keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
			keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle on current file" })
			keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
			keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

			-- 🧠 Setup once — includes renderer + on_attach
			require("nvim-tree").setup({
				view = {
					width = 35,
					relativenumber = true,
				},
				renderer = {
					indent_markers = { enable = true },
					icons = {
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
						},
						glyphs = {
							default = "",
							symlink = "",
							git = {
								unstaged = "✗",
								-- unstaged = "",
								-- unstaged = "",
								--
								staged = "✓",
								-- staged = "",
								--
								unmerged = "",
								--
								-- renamed = "➜",
								renamed = "",
								-- renamed = "",
								-- renamed = "",
								--
								-- untracked = "★",
								-- untracked = "",
								-- untracked = "",
								-- untracked = "",
								untracked = "",
								-- untracked = "",
								--
								--
								-- deleted = "",
								deleted = "",
								--
								ignored = "◌",
								--
							},
							folder = {
								arrow_closed = "",
								arrow_open = "",
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
							},
						},
					},
				},
				on_attach = function(bufnr)
					local api = require("nvim-tree.api")
					api.config.mappings.default_on_attach(bufnr)

					local function opts(desc)
						return {
							desc = "nvim-tree: " .. desc,
							buffer = bufnr,
							noremap = true,
							silent = true,
							nowait = true,
						}
					end

					vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", opts("Tmux Navigate Left"))
					vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", opts("Tmux Navigate Right"))
					vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", opts("Tmux Navigate Down"))
					vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", opts("Tmux Navigate Up"))
					--
					--
					-- shift-Cd will change the tree focuse to the folder under the cursor
					vim.keymap.set("n", "Cd", function()
						local node = api.tree.get_node_under_cursor()
						if node and node.type == "directory" then
							api.tree.change_root(node.absolute_path)
						end
					end, opts("CD into folder under cursor"))
					--
					--
					--
					-- 📝 Override `r` for Git-aware rename
					vim.keymap.set("n", "r", function()
						local node = api.tree.get_node_under_cursor()
						if node then
							git_aware_rename(node)
						end
					end, opts("Git-aware rename"))
					--
					--
					--
					--
				end,
			})
		end,
	},

	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	dependencies = "nvim-tree/nvim-web-devicons", -- Icon support for file types
	-- 	config = function()
	-- 		require("nvim-tree").setup({
	-- 			view = {
	-- 				width = 35, -- Width of the file explorer
	-- 				relativenumber = true, -- Show relative line numbers
	-- 			},
	-- 			renderer = {
	-- 				indent_markers = {
	-- 					enable = true, -- Enable folder indent markers
	-- 				},
	-- 				icons = {
	-- 					show = {
	-- 						file = true, -- Show icons for files
	-- 						folder = true, -- Show icons for folders
	-- 						folder_arrow = true, -- Show arrows for open/closed folders
	-- 						git = true, -- Show git icons (like changes)
	-- 					},
	-- 					glyphs = {
	-- 						default = "", -- Default icon for unknown file types
	-- 						symlink = "", -- Symlink icon
	-- 						git = {
	-- 							unstaged = "✗",
	-- 							staged = "✓",
	-- 							unmerged = "",
	-- 							renamed = "➜",
	-- 							untracked = "★",
	-- 							deleted = "",
	-- 							ignored = "◌",
	-- 						},
	-- 						folder = {
	-- 							arrow_closed = "", -- Closed folder icon
	-- 							arrow_open = "", -- Open folder icon
	-- 							default = "", -- Default folder icon
	-- 							open = "", -- Open folder icon
	-- 							empty = "", -- Empty folder icon
	-- 							empty_open = "", -- Open empty folder icon
	-- 							symlink = "", -- Symlinked folder icon
	-- 						},
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		-- Keymaps
	-- 		local keymap = vim.keymap -- for conciseness
	--
	-- 		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
	-- 		keymap.set(
	-- 			"n",
	-- 			"<leader>ef",
	-- 			"<cmd>NvimTreeFindFileToggle<CR>",
	-- 			{ desc = "Toggle file explorer on current file" }
	-- 		) -- toggle file explorer on current file
	-- 		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
	-- 		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	-- 		--
	-- 		--
	-- 		--
	-- 		-- tmux
	-- 		require("nvim-tree").setup({
	-- 			on_attach = function(bufnr)
	-- 				local api = require("nvim-tree.api")
	--
	-- 				-- Load default mappings first
	-- 				api.config.mappings.default_on_attach(bufnr)
	--
	-- 				-- Helper function for keymap options
	-- 				local function opts(desc)
	-- 					return {
	-- 						desc = "nvim-tree: " .. desc,
	-- 						buffer = bufnr,
	-- 						noremap = true,
	-- 						silent = true,
	-- 						nowait = true,
	-- 					}
	-- 				end
	--
	-- 				-- Override with tmux navigation
	-- 				vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", opts("Tmux Navigate Left"))
	-- 				vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", opts("Tmux Navigate Right"))
	-- 				vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", opts("Tmux Navigate Down"))
	-- 				vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", opts("Tmux Navigate Up"))
	-- 			end,
	-- 		})
	-- 		--
	-- 		--
	-- 		vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#ff8800" }) -- unstaged
	-- 		vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#00ff00" }) -- staged
	-- 		vim.api.nvim_set_hl(0, "NvimTreeGitMerge", { fg = "#ff00ff" }) -- unmerged
	-- 		vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#00ffff" }) -- renamed
	-- 		vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#ffff00" }) -- untracked
	-- 		vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#ff0000" }) -- deleted
	-- 		vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#aaaaaa" }) -- ignored
	--
	-- 		--
	-- 	end,
	-- },
}
