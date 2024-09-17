return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim", "jay-babu/mason-null-ls.nvim", "nvimtools/none-ls-extras.nvim" },
	opts = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions

		require("mason-null-ls").setup({
			ensure_installed = {
				"prettier",
				"eslint-lsp",
				"stylua",
				"selene",
			},
			automatic_installation = true,
		})

		return {
			sources = {
				-- JavaScript/TypeScript
				formatting.prettier,
				require("none-ls.diagnostics.eslint"),

				-- Lua
				formatting.stylua,
				-- diagnostics.selene,

				-- Git and refactoring tools
				code_actions.gitsigns,
				code_actions.refactoring,
			},
		}
	end,
}

