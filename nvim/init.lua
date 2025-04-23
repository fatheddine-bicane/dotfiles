--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================


What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--plugings
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	{ import = "custom.plugins" },
})
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--neovide configurations
--
-- Neovide specific configurations
if vim.g.neovide then
	-- Enable full screen mode by default
	vim.g.neovide_fullscreen = true

	-- Font configuration to match Alacritty
	vim.o.guifont = "FiraMono Nerd Font:h14"
end
--
--
-- Fast paste configuration for insert mode
if vim.g.neovide then
	-- For macOS (Command+V)
	vim.keymap.set("i", "<D-v>", "<Esc>p`]a", { noremap = true, silent = true })

	-- For Linux/Windows (Ctrl+Shift+V)
	vim.keymap.set("i", "<C-S-v>", "<Esc>p`]a", { noremap = true, silent = true })
end
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--tab characrer settings
-- Set tab and indentation settings to insert actual tab characters
vim.o.expandtab = false -- Disables the use of spaces instead of tabs
vim.o.tabstop = 4 -- Number of spaces per tab character
vim.o.softtabstop = 4 -- Number of spaces to insert for each tab
vim.o.shiftwidth = 4 -- Number of spaces to use for each indentation level
vim.o.smarttab = true -- Enables smart tabbing behavior
vim.o.autoindent = true -- Enable automatic indentation
vim.o.smartindent = true -- Automatically insert indent on new lines

--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
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
vim.api.nvim_set_keymap("v", "{", "<esc>`<O{<esc>`>o}<esc>gv=gv", { noremap = true, silent = true })
--
--
--
--
--
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

local builtin = require("telescope.builtin")
vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
--
--
--
--
--
--this fix the identation on all files type ({} js problem)
vim.cmd([[
  autocmd FileType * setlocal smartindent noautoindent nosmarttab
  autocmd FileType * setlocal indentexpr=
]])
--
--
--
--
--
--
--
--
--
--
--
-- Custom commands region
--
-- Command to load all files in current directory to buffer
--
--
vim.api.nvim_create_user_command("Loadall", function()
	-- Get all files in current directory and subdirectories
	local files = vim.fn.systemlist('find . -type f -not -path "*/\\.*"')
	local count = 0
	local current_buf = vim.api.nvim_get_current_buf()

	for _, file in ipairs(files) do
		-- Clean the path (remove leading ./)
		local clean_file = string.gsub(file, "^%./", "")
		-- Skip certain directories and file types
		if
			not string.match(clean_file, "^%.git/")
			and not string.match(clean_file, "^node_modules/")
			and not string.match(clean_file, "%.png$")
			and not string.match(clean_file, "%.jpg$")
		then
			-- Use edit command to load the file properly
			vim.cmd("edit " .. vim.fn.fnameescape(clean_file))
			-- Make sure LSP attaches to this buffer
			vim.cmd("do FileType")
			count = count + 1
		end
	end

	-- Return to the original buffer
	vim.api.nvim_set_current_buf(current_buf)

	-- Force LSP to attach and analyze all buffers
	vim.cmd("silent! bufdo LspStart")

	-- Wait a bit for LSP to process files
	vim.defer_fn(function()
		-- Show how many files were loaded
		print(count .. " files loaded and processed")
		-- Show all loaded buffers
		vim.cmd("ls")
	end, 500)
end, {
	desc = "Load all files in current directory into buffers with full initialization",
})
