--this region is for key mapping
--
--
--
-- this to map oo to act like escape key (faster way to go to normal mod)
-- vim.api.nvim_set_keymap("n", "oo", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "oo", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "oo", "<Esc>", { noremap = true, silent = true })
--
--this will make shift l and h move by words
vim.api.nvim_set_keymap("n", "L", "w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "H", "b", { noremap = true, silent = true })
--
--
--ctrl arrow up down to move slected line
-- Move lines up or down in normal mode
-- vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
-- vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", ":m .+1<CR>==", { noremap = true, silent = true })
--
--
--
--
-- Move selected lines up or down in visual mode
-- vim.keymap.set("v", "<a-k>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })
-- vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<Up>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
--
--
--make ctrl c coopy or command c in mac
-- Use Command+C in Visual mode to copy to clipboard (if terminal supports it)
vim.keymap.set("v", "<D-c>", '"+y', { noremap = true, silent = true })

-- Use Control+C in Visual mode to copy to clipboard
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
--
--
--
---- Command + C for Visual mode (requires terminal to send escape sequence)
vim.keymap.set("v", "<Esc>[c", '"+y', { noremap = true, silent = true })
--
--
--
-- Command + C for Normal mode
vim.keymap.set("n", "<Esc>[c", '"+yy', { noremap = true, silent = true })
--
--
--
-- Tab to add an extra tab (indent) in visual mode
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
-- Shift+Tab to remove an extra tab (un-indent) in Visual mode
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
--
--
--
-- Keymap for commenting selected text with Ctrl+/
vim.keymap.set("v", "<C-/>", ":s/^/\\/\\/ /<CR>", { noremap = true, silent = true })
--
--
--
--
-- Mapping to wrap selected text with curly braces in visual mode and indent the content
vim.api.nvim_set_keymap("v", "{", "<esc>`<O{<esc>`>o}<esc>gv=gv<esc>", { noremap = true, silent = true })
--
--
--
--reload a file <space r>
vim.keymap.set("n", "<leader>r", ":e<CR>", { desc = "Reload file from disk" })
--
--
local builtin = require("telescope.builtin")
vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
--
--
--
