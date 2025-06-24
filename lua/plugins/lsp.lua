return {
    "VonHeikemen/lsp-zero.nvim",
    lazy = false,
    dependencies = {
        "neovim/nvim-lspconfig",
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        },
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
        "folke/neodev.nvim",
    },
    config = function()
        local lsp_zero = require("lsp-zero")
        local lspconfig = require("lspconfig")

        -- lsp_attach: attach keymaps after LSP attaches to buffer
        local lsp_attach = function(_, bufnr)
            local opts = { buffer = bufnr }
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Replace" }))
            vim.keymap.set({ "n", "x" }, "<leader>lf", function()
                vim.lsp.buf.format({ async = true })
            end, vim.tbl_extend("force", opts, { desc = "Format" }))
            vim.keymap.set(
                "n",
                "<leader>la",
                vim.lsp.buf.code_action,
                vim.tbl_extend("force", opts, { desc = "Actions" })
            )
        end

        -- Extend lsp-zero with custom settings
        lsp_zero.extend_lspconfig({
            sign_text = true,
            lsp_attach = lsp_attach,
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        -- Mason & mason-lspconfig setup
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "ts_ls", -- TypeScript/JavaScript (updated name)
                "eslint", -- ESLint
                "tailwindcss", -- Tailwind CSS
                "cssls", -- CSS
                "html", -- HTML
                "jsonls", -- JSON
                "emmet_ls", -- Emmet
                "marksman", -- Markdown
                "denols", -- Deno
                "pyright", -- Python
                "lua_ls", -- Lua
                "bashls", -- Bash
            },
            automatic_installation = true,
            handlers = {
                -- Custom handler for html-lsp -> lspconfig.html
                ["html-lsp"] = function()
                    lspconfig.html.setup({})
                end,

                -- Custom handler for TypeScript server (for Next.js/Node projects)
                ["ts_ls"] = function()
                    lspconfig.ts_ls.setup({
                        root_dir = lspconfig.util.root_pattern("package.json"),
                        single_file_support = false,
                    })
                end,

                -- Custom handler for Deno (only for Deno projects)
                ["denols"] = function()
                    lspconfig.denols.setup({
                        root_dir = function(fname)
                            local has_deno = lspconfig.util.root_pattern("deno.json", "deno.jsonc")(fname)
                            local has_package = lspconfig.util.root_pattern("package.json")(fname)
                            -- Only use Deno if there's a deno config AND no package.json
                            return has_deno and not has_package
                        end,
                        init_options = {
                            lint = true,
                        },
                        -- Explicitly exclude TypeScript files in Node.js projects
                        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
                        on_attach = function(client, bufnr)
                            -- Check if we're in a Node.js project
                            local has_package =
                                lspconfig.util.root_pattern("package.json")(vim.api.nvim_buf_get_name(bufnr))
                            if has_package then
                                -- Stop Deno LSP if we're in a Node.js project
                                vim.lsp.stop_client(client.id)
                                return
                            end
                        end,
                    })
                end,

                -- default handler for other servers
                function(server_name)
                    lspconfig[server_name].setup({})
                end,
            },
        })
    end,
}
