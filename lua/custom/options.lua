-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Better searching
vim.opt.ignorecase = true -- Case insensitive searching unless /C or capital in search
vim.opt.smartcase = true -- Case-sensitive if search contains uppercase letters

-- Better tab behavior
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Auto-indent new lines

-- UI Enhancements
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.cursorline = true -- Highlight the current line

-- Disable swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true -- Enable persistent undo

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Fast updates
vim.opt.updatetime = 300
