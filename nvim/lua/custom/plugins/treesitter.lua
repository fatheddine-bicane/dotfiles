-- INFO: Highlight, edit, and navigate code
return {

	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main", 
		build = ":TSUpdate",
		init = function()
			-- 1. Enable native treesitter highlighting and indentation
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					pcall(vim.treesitter.start)
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})

			-- 2. Diff and install missing parsers manually (replaces ensure_installed)
			-- local ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp" }
			local ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"css",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"javascript",
				"typescript",
				"tsx", -- For React
				"json",
				"python",
				"dockerfile",
				"cpp", --c++
				"java", --java
				"go",
				"rust",
				"embedded_template",
				"yaml", -- YAML Treesitter parser
			}

			local installed = require("nvim-treesitter.config").get_installed()
			local to_install = vim.iter(ensure_installed):filter(function(p)
				return not vim.tbl_contains(installed, p)
			end):totable()

			if #to_install > 0 then
				require("nvim-treesitter").install(to_install)
			end
		end,
		config = function()
			-- The setup API moved to the top-level module
			require("nvim-treesitter").setup({})
		end
	}




	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	build = ":TSUpdate",
	-- 	main = "nvim-treesitter.configs", -- Sets main module to use for opts
	-- 	-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
	-- 	opts = {
	-- 		ensure_installed = {
	-- 			"bash",
	-- 			"c",
	-- 			"diff",
	-- 			"html",
	-- 			"css",
	-- 			"lua",
	-- 			"luadoc",
	-- 			"markdown",
	-- 			"markdown_inline",
	-- 			"query",
	-- 			"vim",
	-- 			"vimdoc",
	-- 			"javascript",
	-- 			"typescript",
	-- 			"tsx", -- For React
	-- 			"json",
	-- 			"python",
	-- 			"dockerfile",
	-- 			"cpp", --c++
	-- 			"java", --java
	-- 			"go",
	-- 			"rust",
	-- 			"embedded_template",
	-- 			"yaml", -- YAML Treesitter parser
	-- 		},
	-- 		-- Autoinstall languages that are not installed
	-- 		auto_install = true,
	-- 		highlight = {
	-- 			enable = true,
	-- 			-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
	-- 			--  If you are experiencing weird indenting issues, add the language to
	-- 			--  the list of additional_vim_regex_highlighting and disabled languages for indent.
	-- 			additional_vim_regex_highlighting = { "ruby" },
	-- 		},
	-- 		indent = { enable = true, disable = { "ruby" } },
	-- 	},
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	-- FILETYPE DETECTION
	-- 	-- ------------------
	-- 	-- Neovim does not ship with a built-in `ejs` filetype.
	-- 	-- This tells Neovim to treat `.ejs` files as `filetype=ejs`
	-- 	-- so plugins (Treesitter, LSP, etc.) can hook into them.
	-- 	-- init = function()
	-- 	-- 	vim.filetype.add({
	-- 	-- 		extension = {
	-- 	-- 			ejs = "ejs",
	-- 	-- 		},
	-- 	-- 	})
	-- 	-- end,
	-- 	-- --
	-- 	-- --
	-- 	-- --
	-- 	-- --
	-- 	-- config = function(_, opts)
	-- 	-- 	-- TREE-SITTER LANGUAGE REGISTRATION
	-- 	-- 	-- --------------------------------
	-- 	-- 	-- There is no Tree-sitter parser named `ejs`.
	-- 	-- 	-- EJS is a template format (HTML + embedded JavaScript),
	-- 	-- 	-- so we reuse the generic `embedded_template` parser.
	-- 	-- 	--
	-- 	-- 	-- This explicitly binds:
	-- 	-- 	--   filetype = "ejs"  →  Tree-sitter parser = "embedded_template"
	-- 	-- 	--
	-- 	-- 	-- Without this registration, Tree-sitter will not attach
	-- 	-- 	-- a parser to `.ejs` buffers, resulting in no highlighting.
	-- 	-- 	vim.treesitter.language.register("embedded_template", "ejs")
	-- 	--
	-- 	-- 	-- Apply the Tree-sitter configuration
	-- 	-- 	require("nvim-treesitter.configs").setup(opts)
	-- 	-- end,
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	--
	-- 	-- There are additional nvim-treesitter modules that you can use to interact
	-- 	-- with nvim-treesitter. You should go explore a few and see what interests you:
	-- 	--
	-- 	--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
	-- 	--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
	-- 	--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	-- },
}
