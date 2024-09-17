return {
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
    "folke/neodev.nvim",
  },
  config = function()
    local lsp_zero = require("lsp-zero")

    -- Custom LSP attach function
    local lsp_attach = function(_, bufnr)
      local opts = { buffer = bufnr }

      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
      vim.keymap.set({ "n", "x" }, "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, { buffer = bufnr, desc = "Format" })
      vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
    end

    lsp_zero.extend_lspconfig({
      sign_text = true,
      on_attach = lsp_attach,
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    require("mason").setup({})
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            on_attach = lsp_attach,
          })
        end,
      },
    })
  end,
}

