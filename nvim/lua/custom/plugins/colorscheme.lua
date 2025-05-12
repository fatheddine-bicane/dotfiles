-- INFO: kanagawa dragon theme
return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			-- Apply the colorscheme first
			vim.cmd.colorscheme("kanagawa-dragon")

			-- Set pure black background
			vim.cmd("highlight Normal guibg=#000000")

			-- Change the line number color
			-- vim.api.nvim_set_hl(0, "LineNr", {
			-- 	fg = "#d1cda8", -- Light beige color for line numbers
			-- 	-- bg = "#000000", -- Pure black background
			-- })

			-- Change NvimTree folder icon color
			vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", {
				fg = "#d1cda8", -- Light beige color for folder icons
			})

			--
			--
			--
			--

			-- Make the sign column background transparent (match Normal)
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

			-- And also fix the sign itself (e.g., DiagnosticSignError or custom)
			vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = "none", fg = "#ff0000" }) -- or your icon color
			vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = "none", fg = "#ffaa00" })
			vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = "none", fg = "#00ffff" })
			vim.api.nvim_set_hl(0, "DiagnosticSignHint", { bg = "none", fg = "#8888ff" })
			-- fix git sign background
			vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#76946a", bg = "none" }) -- green
			vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#dca561", bg = "none" }) -- cyan
			vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#c34043", bg = "none" }) -- red
			--
			--
			--
			--

			vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#282727", bg = "NONE" })
			vim.opt.fillchars:append({ vert = "▌" }) -- use a thick vertical bar
			--
			--
			--
		end,
	},
}

--nordic theme
-- {
-- 	"AlexvZyl/nordic.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("nordic").load()
-- 	end,
-- },
