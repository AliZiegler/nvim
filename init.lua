vim.cmd([[
  filetype plugin indent on    " enable filetype detection and ftplugins
  syntax on                     " enable Vim’s built-in syntax highlighting
]])
-- Load Lazy, key mappings, and options
require("custom.lazy")
require("custom.remap")
require("custom.options")

-- Use system clipboard by default
vim.opt.clipboard = "unnamedplus"

-- Set leaders before lazy.nvim to ensure mappings are correct
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- file colors
-- Custom highlight for JavaScript files (Green)
-- vim.cmd([[autocmd FileType javascript highlight CustomJS guifg=#98C379]])
-- vim.cmd([[autocmd FileType javascript syntax match CustomJS /\v.*/ | highlight link CustomJS Statement]])
--
-- -- Custom highlight for TypeScript files (Blue)
-- vim.cmd([[autocmd FileType typescript highlight CustomTS guifg=#61AFEF]])
-- vim.cmd([[autocmd FileType typescript syntax match CustomTS /\v.*/ | highlight link CustomTS Statement]])
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "denols" then
            -- Check if we're in a Node.js project
            local has_package_json = vim.fn.findfile("package.json", ".;") ~= ""
            if has_package_json then
                vim.lsp.stop_client(client.id)
                print("Stopped Deno LSP in Node.js project")
            end
        end
    end,
})
