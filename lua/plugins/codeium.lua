return {
    "Exafunction/codeium.vim",
    config = function()
        -- Key mappings for Codeium completions
        vim.keymap.set("i", "<C-g>", function()
            return vim.fn["codeium#Accept"]()
        end, { expr = true, silent = true, desc = "Accept Codeium Suggestion" })

        vim.keymap.set("i", "<C-;>", function()
            return vim.fn
        end, { expr = true, silent = true, desc = "Cycle Codeium Completions Forward" })

        vim.keymap.set("i", "<C-,>", function()
            return vim.fn["codeium#CycleCompletions"](-1)
        end, { expr = true, silent = true, desc = "Cycle Codeium Completions Backward" })

        vim.keymap.set("i", "<C-x>", function()
            return vim.fn["codeium#Clear"]()
        end, { expr = true, silent = true, desc = "Clear Codeium Suggestion" })

        -- Talk to Codeium command
        vim.api.nvim_create_user_command("TalkToCodeium", function()
            local input = vim.fn.input("Ask Codeium: ")
            print("Codeium says: " .. input .. " is a great question!")
        end, { desc = "Interact with Codeium" })

        -- Short alias for TalkToCodeium
        vim.api.nvim_create_user_command("TTC", "TalkToCodeium", { desc = "Short alias for Talk to Codeium" })

        -- Keybinding for TalkToCodeium
        vim.keymap.set("n", "<leader>tc", ":TalkToCodeium<CR>", { silent = true, desc = "Talk to Codeium" })

        -- Status check function
        vim.api.nvim_create_user_command("CheckCodeium", function()
            local status = vim.fn["codeium#GetStatus"]()
            print("Codeium status: " .. status)
        end, { desc = "Check Codeium Status" })

        -- Toggle Codeium
        local codeium_enabled = true
        vim.api.nvim_create_user_command("ToggleCodeium", function()
            codeium_enabled = not codeium_enabled
            if codeium_enabled then
                vim.fn["codeium#Enable"]()
                print("Codeium enabled")
            else
                vim.fn["codeium#Disable"]()
                print("Codeium disabled")
            end
        end, { desc = "Toggle Codeium" })
    end,
}

