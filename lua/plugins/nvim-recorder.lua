return {
    "chrisgrieser/nvim-recorder",
    opts = {
        -- Named registers where macros are saved (single lowercase letters only).
        -- The first register is the default register used as macro-slot after startup.
        slots = { "a", "b" },

        mapping = {
            startStopRecording = "q",
            playMacro = "Q",
            switchSlot = "<C-q>",
            editMacro = "<M-q>",
            deleteAllMacros = "dq",
            yankMacro = "yq",
            -- ⚠️ this should be a string you don't use in insert mode during a macro
            addBreakPoint = "##",
        },

        -- Clears all macro slots on startup.
        clear = false,

        -- Log level used for non-critical notifications.
        logLevel = vim.log.levels.INFO, -- :help vim.log.levels

        -- Suppresses unnecessary notifications.
        lessNotifications = false,

        -- Enables nerd font icons for status bar and keymap descriptions.
        useNerdfontIcons = true,

        -- Performance optimizations for macros with high count.
        performanceOpts = {
            countThreshold = 100,
            lazyredraw = true,
            noSystemClipboard = true,
            autocmdEventsIgnore = {
                "TextChangedI",
                "TextChanged",
                "InsertLeave",
                "InsertEnter",
                "InsertCharPre",
            },
        },

        -- Experimental: sharing keymaps with nvim-dap.
        dapSharedKeymaps = false,
    },
}
