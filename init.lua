-- Load Lazy, key mappings, and options
require("custom.lazy")
require("custom.remap")
require("custom.options")

-- Use system clipboard by default
vim.opt.clipboard = "unnamedplus"

-- Set leaders before lazy.nvim to ensure mappings are correct
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
