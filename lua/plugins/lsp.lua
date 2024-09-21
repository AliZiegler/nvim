return {
	"VonHeikemen/lsp-zero.nvim",
	lazy = false,
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
		"folke/neodev.nvim", -- Lua development enhancements
	},
	config = function()
		local lsp_zero = require("lsp-zero")

		-- lsp_attach is where you enable features that only work
		-- if there is a language server active in the file
		local lsp_attach = function(_, bufnr)
			local opts = { buffer = bufnr }

			vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
			vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
			vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
			vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
			vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
			vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
			vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
			vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = bufnr, desc = "Replace" })
			vim.keymap.set(
				{ "n", "x" },
				"<leader>lf",
				"<cmd>lua vim.lsp.buf.format({async = true})<cr>",
				{ buffer = bufnr, desc = "Format" }
			)
			vim.keymap.set(
				"n",
				"<leader>la",
				"<cmd>lua vim.lsp.buf.code_action()<cr>",
				{ buffer = bufnr, desc = "Actions" }
			)
		end

		lsp_zero.extend_lspconfig({
			sign_text = true,
			lsp_attach = lsp_attach,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"tsserver", -- TypeScript/JavaScript
				"sumneko_lua", -- Lua (useful for Neovim config)
				"pyright", -- Python
				"html", -- HTML
				"cssls", -- CSS
				"jsonls", -- JSON
				"bashls", -- Bash
			},
			automatic_installation = true,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			},
		})
	end,
}
