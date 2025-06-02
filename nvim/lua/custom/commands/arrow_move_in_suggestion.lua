--forces arrow to mouve up and down (to solve the aut recommand prob)
local cmp = require("cmp")

cmp.setup({
	mapping = {
		["<Up>"] = function(fallback)
			if cmp.visible() then
				cmp.close() -- Close the completion menu
				fallback() -- Fallback to default arrow key behavior
			else
				fallback()
			end
		end,
		["<Down>"] = function(fallback)
			if cmp.visible() then
				cmp.close()
				fallback()
			else
				fallback()
			end
		end,
	},
})
