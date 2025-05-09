--INFO:auto pair
return {
	{
		"windwp/nvim-autopairs", -- Optional dependency for auto-pairs to work with completion
		dependencies = { "hrsh7th/nvim-cmp" }, -- nvim-cmp for completion support
		config = function()
			-- Configure nvim-autopairs with default settings
			require("nvim-autopairs").setup({})

			-- Integrate nvim-autopairs with nvim-cmp for auto-pairing completion
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")

			-- Make nvim-autopairs work with completion confirmations
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
