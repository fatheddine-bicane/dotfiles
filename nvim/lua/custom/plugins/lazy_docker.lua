-- INFO: lazydocker pluging manager

-- WARNING: the lazydocker executable is nedded
-- run $> brew install lazydocker


return {
	"mgierada/lazydocker.nvim",
	dependencies = { "akinsho/toggleterm.nvim" },
	config = function()
		require("lazydocker").setup({
			border = "rounded",  -- optional
		})
	end,
	keys = {
		{ "<leader>dd", function() require("lazydocker").open() end, desc = "Open Lazydocker" },
	},
}
