return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "andrew-george/telescope-themes" },
    config = function()
        --telescope-themes setup
        local telescope = require("telescope")
        telescope.load_extension("themes")

        local tel = require("telescope.builtin")
        vim.keymap.set("n", "<leader>f", tel.find_files, { desc = "Files" })
        vim.keymap.set("n", "<leader>sf", tel.git_files, { desc = "Git Files" })
        vim.keymap.set("n", "<leader>sq", tel.quickfix, { desc = "Quickfix" })
        vim.keymap.set("n", "<leader>sb", tel.builtin, { desc = "Telescope Builtins" })
        vim.keymap.set("n", "<leader>sh", tel.help_tags, { desc = "Help" })
        vim.keymap.set("n", "<leader>ss", tel.grep_string, { desc = "Grep String" })
        vim.keymap.set("n", "<leader>st", tel.live_grep, { desc = "Git Text" })
        vim.keymap.set("n", "<leader>sr", tel.resume, { desc = "Resume" })
        vim.keymap.set("n", "<leader>ls", tel.lsp_document_symbols, { desc = "Symbols Document" })
        vim.keymap.set("n", "<leader>lS", tel.lsp_dynamic_workspace_symbols, { desc = "Symbols Workspace" })
        vim.keymap.set("n", "<leader>ld", function()
            tel.diagnostics({ bufnr = 0 })
        end, { desc = "Diagnostics" })
        vim.keymap.set("n", "<leader>lD", tel.diagnostics, { desc = "Global Diagnostics" })
    end,
}
