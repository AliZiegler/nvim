vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>q", ":q!<CR>")
vim.keymap.set("n", "<leader>w", ":w!<CR>")
vim.keymap.set("n", "<leader>hi", ":noh<CR>", { desc = "Hide search highlight" })

--vim.keymap.set("i", ";j", "<Esc>", { silent = true, desc = "which_key_ignore" })
--vim.keymap.set({ "o", "v", "n", "x" }, ";j", "<Esc>", { silent = true, desc = "Normal Mode" })
--vim.keymap.set({ "c" }, ";j", "<C-c>", { silent = true, desc = "which_key_ignore" })
--vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after moving down half-page" })
--vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor after moving up half-page" })
-- Make yank use system clipboard
--vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
--vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })

-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from clipboard" })
--telescope themes
vim.keymap.set("n", "<leader>th", ":Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })
--Twilight
vim.keymap.set("n", "<leader>tw", ":Twilight<CR>", { noremap = true, silent = true, desc = "Twilight" })
--vim-smooth-scroll
vim.keymap.set(
    "n",
    "<C-u>",
    ":call smooth_scroll#up(&scroll, 0, 2)<CR>zz",
    { noremap = true, silent = true, desc = "Smooth move up half-page" }
)
vim.keymap.set(
    "n",
    "<C-d>",
    ":call smooth_scroll#down(&scroll, 0, 2)<CR>zz",
    { noremap = true, silent = true, desc = "Smooth move down half-page" }
)
vim.keymap.set(
    "n",
    "<C-b>",
    ":call smooth_scroll#up(&scroll*2, 0, 4)<CR>zz",
    { noremap = true, silent = true, desc = "Smooth move up page" }
)
vim.keymap.set(
    "n",
    "<C-f>",
    ":call smooth_scroll#down(&scroll*2, 0, 4)<CR>zz",
    { noremap = true, silent = true, desc = "Smooth move down page" }
)
