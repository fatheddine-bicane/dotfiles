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
--]]
--
--
--load the default kickstart
require("custom.init_lua.defualt")
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
-- Load custom commands
require("custom.commands.tab_preferences")
require("custom.commands.custum_key_map")
require("custom.commands.fix_identation_all_file_types")
require("custom.commands.remove_comment_continuation")
require("custom.commands.load_to_buffer")
require("custom.commands.arrow_move_in_suggestion")
require("custom.commands.preferences_theme_color")
require("custom.commands.neovide_setings")
