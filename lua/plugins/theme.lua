--return { "rose-pine/neovim", name = "rose-pine" , config= function()
--	require("rose-pine").setup({
--    styles = {
 --       transparency = true,
  --  }})
--vim.cmd.colorscheme 'rose-pine'
--end}
return {
  -- Theme inspired by Atom
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    require('onedark').setup {
      transparent = true,
      style = 'warmer',
    }
    require('onedark').load()
    vim.cmd.colorscheme 'onedark'
  end,
}
-- return { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 }
