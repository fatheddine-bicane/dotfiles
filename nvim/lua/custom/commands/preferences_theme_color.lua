--nvim cursor to be white
vim.opt.termguicolors = true

vim.opt.guicursor = table.concat({
	"n-v-c:block-Cursor",
	"i-ci-ve:ver25-Cursor",
	"r-cr:hor20-Cursor",
	"o:hor50-Cursor",
	"a:blinkon0",
}, ",")

vim.cmd("highlight Cursor guifg=black guibg=white")
--
--
--
--using the jetbrains nerdfont in neovide
vim.opt.guifont = "JetBrainsMono Nerd Font:h14"
