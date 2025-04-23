-- Function Signature Help
return {
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy", -- This ensures the plugin loads lazily when you need it
		config = function()
			require("lsp_signature").setup({
				bind = true, -- Bind the signature to the function
				hint_enable = true, -- Enable parameter hints
				floating_window = true, -- Show signature in a floating window
				hint_prefix = "🔍 ", -- Custom prefix for the hint
				handler_opts = {
					border = "rounded", -- You can set the border type for the floating window
				},
				-- Adjust the vertical position of the floating window
				-- floating_window_off_y = 2, -- Move the window down by 1 line
			})
		end,
	},
}
