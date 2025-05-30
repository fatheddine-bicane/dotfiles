return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
	config = function()
		-- Disable tmux navigator when zooming the Vim pane
		vim.g.tmux_navigator_disable_when_zoomed = 1

		-- If you want to disable wrapping
		vim.g.tmux_navigator_no_wrap = 1

		-- Custom commands for special cases (like file trees)
		vim.g.tmux_navigator_save_on_switch = 2
	end,
}
