vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>w", vim.cmd.w)

vim.keymap.set("i", ";j", "<Esc>", { silent = true, desc = "which_key_ignore" })
--vim.keymap.set({ "o", "v", "n", "x" }, ";j", "<Esc>", { silent = true, desc = "Normal Mode" })
--vim.keymap.set({ "c" }, ";j", "<C-c>", { silent = true, desc = "which_key_ignore" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after moving down half-page" })
