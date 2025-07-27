if vim.g.neovide then
	-- Set GUI font
	vim.opt.guifont = "JetBrainsMono Nerd Font:h14"

	-- refresh rate and translucency
	vim.g.neovide_refresh_rate = 120
	vim.g.neovide_transparency = 0.85
	vim.g.neovide_window_blurred = true
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0
	-- cursor fx
	vim.g.neovide_cursor_vfx_mode = ""
	vim.g.neovide_cursor_smooth_blink = true
	vim.g.neovide_cursor_vfx_particle_density = 16.8
	vim.g.neovide_cursor_vfx_particle_lifetime = 2.2
	vim.g.neovide_cursor_vfx_particle_phase = 1.2
	vim.g.neovide_cursor_vfx_particle_curl = 1.0
	vim.g.neovide_cursor_animation_length = 0.08
	vim.g.neovide_cursor_trail_size = 0.8
	-- floating shadow
	vim.g.neovide_floating_shadow = true
	vim.g.neovide_floating_z_height = 10
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 3
	vim.g.neovide_floating_blur_amount_x = 1.0
	vim.g.neovide_floating_blur_amount_y = 1.0
	vim.g.neovide_floating_corner_radius = 0.50
	-- scaling
	vim.g.neovide_scale_factor = 1.0
	-- padding
	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0

	-- Set terminal colors (Kanagawa Dragon)
	vim.g.terminal_color_0 = "#0d0c0c"
	vim.g.terminal_color_1 = "#c4746e"
	vim.g.terminal_color_2 = "#8a9a7b"
	vim.g.terminal_color_3 = "#c4b28a"
	vim.g.terminal_color_4 = "#8ba4b0"
	vim.g.terminal_color_5 = "#a292a3"
	vim.g.terminal_color_6 = "#8ea4a2"
	vim.g.terminal_color_7 = "#C8C093"
	vim.g.terminal_color_8 = "#a6a69c"
	vim.g.terminal_color_9 = "#E46876"
	vim.g.terminal_color_10 = "#87a987"
	vim.g.terminal_color_11 = "#E6C384"
	vim.g.terminal_color_12 = "#7FB4CA"
	vim.g.terminal_color_13 = "#938AA9"
	vim.g.terminal_color_14 = "#7AA89F"
	vim.g.terminal_color_15 = "#c5c9c5"

	-- Terminal Colors
	vim.g.neovide_background_color = "#000000"
	vim.g.neovide_foreground_color = "#c5c9c5"
	vim.g.neovide_cursor_text_color = "#C8C093"

	-- Set terminal colors
	vim.api.nvim_set_hl(0, "Normal", { fg = vim.g.neovide_foreground_color, bg = vim.g.neovide_background_color })

	-- Set cursor color
	vim.api.nvim_set_hl(0, "Cursor", {
		fg = vim.g.neovide_cursor_text_color,
		bg = vim.g.neovide_background_color,
	})

	-- Titlebar Colors
	vim.g.neovide_title_text_color = vim.g.terminal_color_13 -- pink
	vim.g.neovide_title_background_color = vim.g.neovide_background_color --terminal background

	-- Clipboard mappings
	local modes = { "n", "v", "c", "i" }

	-- System clipboard mappings
	for _, mode in ipairs(modes) do
		if mode == "c" or mode == "i" then
			vim.keymap.set(mode, "<C-v>", "<C-r>+", { silent = true })
			vim.keymap.set(mode, "<C-c>", "<C-r>+", { silent = true })
		else
			vim.keymap.set(mode, "<C-v>", ":r !xsel -b<CR>", { silent = true })
			vim.keymap.set(mode, "<C-c>", ":w !xsel -i -b<CR>", { silent = true })
		end
	end

	-- Wezterm-style clipboard mappings (Control-Shift)
	for _, mode in ipairs(modes) do
		if mode == "c" or mode == "i" then
			vim.keymap.set(mode, "<C-S-v>", "<C-r>+", { silent = true })
			vim.keymap.set(mode, "<C-S-c>", "<C-r>+", { silent = true })
		else
			vim.keymap.set(mode, "<C-S-v>", ":r !xsel -b<CR>", { silent = true })
			vim.keymap.set(mode, "<C-S-c>", ":w !xsel -i -b<CR>", { silent = true })
		end
	end

	-- F11 toggle fullscreen
	vim.keymap.set("n", "<F11>", function()
		vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
	end, {})

	------------------------------------------------------------------------------------------------------
	-- The code below this line defines the terminal behavior and generally should not need to be modified
	------------------------------------------------------------------------------------------------------

	-- Hide commandline
	vim.o.laststatus = 0
	vim.o.cmdheight = 0

	-- Set titlebar text
	vim.opt.titlestring = "NeoTerm"
	vim.opt.title = true

	-- Start terminal and configure quit behavior
	vim.cmd([[
set termguicolors
terminal
startinsert
autocmd BufLeave term://* quit
]])
end
