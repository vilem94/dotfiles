-- Lua
local grapple = require("grapple")

require("grapple").setup({
        icons = false,
        scope = "global",
        win_opts = {
            -- Can be fractional
            width = 120,
            height = 20,
            row = 0.5,
            col = 0.5,

            relative = "editor",
            border = "single",
            focusable = false,
            style = "minimal",
            title_pos = "center",

            -- Custom: fallback title for Grapple windows
            title = "Grapple",

            -- Custom: adds padding around window title
            title_padding = " ",
        },
    })
vim.keymap.set("n", "<leader>m", require("grapple").toggle)
vim.keymap.set("n", "<leader>M", require("grapple").toggle_tags)

-- User command
vim.keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<cr>")
