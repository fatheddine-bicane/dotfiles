-- INFO: smart_rename
return {
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
			vim.keymap.set("n", "<C-p>", function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end, { expr = true })
		end,
	},
}
