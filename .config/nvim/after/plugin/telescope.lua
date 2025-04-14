local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {

    pickers = {
        find_files = {
            hidden = true,
            mappings = {
                i = { ["<c-f>"] = require('telescope.actions').to_fuzzy_refine },
            },
        },

        live_grep = {
            mappings = {
                i = { ["<c-f>"] = require('telescope.actions').to_fuzzy_refine },
            },
            hidden = true,
            additional_args = function(opts)
                return {"--hidden"}
            end

        },
        grep_string = {
            hidden = true,
            additional_args = function(opts)
                return {"--hidden"}
            end

        }
    }
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fd', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})

