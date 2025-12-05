return {

	-- INFO: Draws all indent levels, on all lines
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "│",
			},
			scope = { enabled = false }, -- because mini.indentscope handles the active one
		},
	},
	--
	--
	--
	--
	--
	--
	-- INFO: Highlights only the indent your cursor is currently in
	{
		"echasnovski/mini.indentscope",
		version = false,
		opts = {
			-- symbol = "»",
			symbol = "│",
			--
			-- Remove delay
			draw = {
				delay = 0,
				animation = function() return 0 end,
			},
		},
		--
		-- Dont highlight tabs in these windows:
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
					"NvimTree",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		--
		--
		--
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
			--
			vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#ff9e3b" })
			--
			-- ...AND create an autocmd to re-apply it every time the colorscheme changes
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = function()
					vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#ff9e3b" })
				end,
			})
		end,
	}
}
