-- INFO: kanagawa dragon theme

-- return {
-- 	{
-- 		"rebelot/kanagawa.nvim",
-- 		config = function()
-- 			--
-- 			--
-- 			-- Apply the colorscheme first
-- 			vim.cmd.colorscheme("kanagawa-dragon")
-- 			--
-- 			--
-- 			--
-- 			--
-- 			-- Set pure black background
-- 			vim.cmd("highlight Normal guibg=#000000")
-- 			--
-- 			--
-- 			--
-- 			--
-- 			-- Change the line number color
-- 			-- vim.api.nvim_set_hl(0, "LineNr", {
-- 			-- 	fg = "#d1cda8", -- Light beige color for line numbers
-- 			-- 	-- bg = "#000000", -- Pure black background
-- 			-- 	bg = "#282727",
-- 			-- })
-- 			--
-- 			--
-- 			--
-- 			--
-- 			-- Change NvimTree folder icon color
-- 			vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", {
-- 				fg = "#d1cda8", -- Light beige color for folder icons
-- 			})
-- 			--
-- 			--
-- 			--
-- 			--
-- 			-- -- change the tree git sign colors
-- 			vim.api.nvim_set_hl(0, "NvimTreeGitDirtyIcon", { fg = "#d4a76b", bg = "none" })
-- 			vim.api.nvim_set_hl(0, "NvimTreeGitNewIcon", { fg = "#7c936e", bg = "none" })
-- 			vim.api.nvim_set_hl(0, "NvimTreeGitDeletedIcon", { fg = "#b44a48", bg = "none" })
-- 			vim.api.nvim_set_hl(0, "NvimTreeGitRenamedIcon", { fg = "#b97871", bg = "none" })
-- 			vim.api.nvim_set_hl(0, "NvimTreeGitIgnoredIcon", { fg = "#757c74", bg = "none" })
-- 			--
-- 			--
-- 			--
-- 			--
-- 			-- Make the sign column background transparent (match Normal)
-- 			vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- 			--
-- 			--
-- 			--
-- 			--
-- 			-- Make the sign column background transparent (match Normal)
-- 			vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- 			-- DiagnosticSignError signs color
-- 			vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = "none", fg = "#ff0000" }) -- or your icon color
-- 			vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = "none", fg = "#ffaa00" })
-- 			vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = "none", fg = "#00ffff" })
-- 			vim.api.nvim_set_hl(0, "DiagnosticSignHint", { bg = "none", fg = "#8888ff" })
-- 			-- git signs collor in text editor
-- 			vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#76946a", bg = "none" }) -- green
-- 			vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#dca561", bg = "none" }) -- cyan
-- 			vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#c34043", bg = "none" }) -- red
-- 			--
-- 			--
-- 			--
-- 			--
-- 			--
-- 			-- Seperator
-- 			vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#282727", bg = "NONE" })
-- 			vim.opt.fillchars:append({ vert = "▌" }) -- use a thick vertical bar
-- 			--
-- 			--
-- 			--
-- 		end,
-- 	},
-- }


return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- or "latte", "frappe", "macchiato"
				transparent_background = false,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					telescope = true,
					treesitter = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
