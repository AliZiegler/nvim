return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function()
		-- document existing key chains
		local wk = require("which-key")
		wk.add({
			{ "<leader>e", name = "Explorer", icon = { icon = "󰙅" } },
			{ "<leader>a", name = "Mark", icon = { icon = "" } },
			{ "<leader>j", name = "Harpoon", icon = { icon = "" } },
			{ "<leader>l", name = "Lsp", icon = { icon = "" } },
			{ "<leader>s", name = "Search" },
			{ "<leader>u", name = "Undotree", icon = { icon = "󰕍" } },
			{ "<leader>w", name = "Save", icon = { icon = "" } },
			{ "<leader>q", name = "Leave", icon = { icon = "󰕍" } },

			-- Add codeium mappings
			{ "<leader>c", name = "Codeium", icon = { icon = "ﯓ" }, desc = "Codeium Plugin" },
			{ "<leader>c<CR>", name = "Accept Completion", icon = { icon = "✔" }, desc = "Accept completion" },
			{
				"<leader>c<;>",
				name = "Cycle Completion Forward",
				icon = { icon = "🔄" },
				desc = "Cycle completions forward",
			},
			{
				"<leader>c<,>",
				name = "Cycle Completion Backward",
				icon = { icon = "🔄" },
				desc = "Cycle completions backward",
			},
			{ "<leader>c<x>", name = "Clear Completion", icon = { icon = "✖" }, desc = "Clear completion" },
		})
	end,
}
