return {
    "Exafunction/codeium.vim",
    event = { "BufReadPre", "BufNewFile" }, -- Load only when needed
    dependencies = {
        "nvim-lua/plenary.nvim",         -- Optional: for better async handling
    },
    config = function()
        -- Configuration options
        vim.g.codeium_disable_bindings = 1 -- Disable default bindings
        vim.g.codeium_idle_delay = 75 -- Reduce delay for suggestions (default: 75ms)
        vim.g.codeium_manual_trigger = true -- Enable manual trigger mode

        -- Key mappings with better descriptions
        local function map(mode, lhs, rhs, opts)
            local options = { silent = true }
            if opts then
                options = vim.tbl_extend("force", options, opts)
            end
            vim.keymap.set(mode, lhs, rhs, options)
        end

        -- Completion keybindings
        map("i", "<C-f>", function()
            return vim.fn["codeium#Accept"]()
        end, { expr = true, desc = "Accept Codeium suggestion" })
        map("i", "<C-n>", function()
            return vim.fn["codeium#CycleCompletions"](1)
        end, { expr = true, desc = "Next Codeium suggestion" })
        map("i", "<C-p>", function()
            return vim.fn["codeium#CycleCompletions"](-1)
        end, { expr = true, desc = "Previous Codeium suggestion" })
        map("i", "<C-x>", function()
            return vim.fn["codeium#Clear"]()
        end, { expr = true, desc = "Clear Codeium suggestion" })

        -- Enhanced status function with more details
        local function get_detailed_status()
            local status = vim.fn["codeium#GetStatusString"]()
            local enabled = vim.g.codeium_enabled == 1 and "Enabled" or "Disabled"
            return string.format("Codeium: %s | Status: %s", enabled, status)
        end

        -- Commands with better feedback
        vim.api.nvim_create_user_command("CodeiumStatus", function()
            vim.notify(get_detailed_status(), vim.log.levels.INFO)
        end, { desc = "Show Codeium detailed status" })
        -- Chat functionality with better UI feedback
        vim.api.nvim_create_user_command("CodeiumChat", function()
            -- Create a floating window for input
            local input = vim.fn.input({
                prompt = "Ask Codeium: ",
                completion = "custom,CodeiumChatComplete",
            })
            if input ~= "" then
                -- TODO: Integrate with Codeium's chat API when available
                vim.notify("Chat feature coming soon!", vim.log.levels.INFO)
            end
        end, { desc = "Chat with Codeium" })

        -- Statusline component
        -- Can be used with lualine or other statusline plugins
        _G.codeium_status = function()
            return vim.fn["codeium#GetStatusString"]()
        end
    end,
}
