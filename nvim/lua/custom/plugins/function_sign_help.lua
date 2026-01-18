-- INFO: Function Signature Help
return {
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy", -- This ensures the plugin loads lazily when you need it

		config = function()

			require("lsp_signature").setup({
				bind = true,
				hint_enable = true,
				floating_window = true,

				floating_window_above_cur_line = false,-- prefer below cursor
				floating_window_off_y = 0,-- push it fully below the current line
				handler_opts = {
					border = "rounded",
				},
			})
		end,
	},
}
