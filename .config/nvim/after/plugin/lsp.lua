-- First, initialize the diagnostic signs
vim.fn.sign_define('DiagnosticSignError', { text = 'E', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = 'W', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = 'I', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = 'H', texthl = 'DiagnosticSignHint' })

-- Configure diagnostics display
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- Define on_attach function for keymaps and settings
local on_attach = function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>dr", vim.lsp.buf.references, opts)
end

-- Setup capabilities (needed for autocompletion)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Configure servers
local lspconfig = require('lspconfig')

-- Marksman
lspconfig.marksman.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

-- Clangd
lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
    }
})



-- Python
lspconfig.pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                -- formatter options
                black = { enabled = true },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                flake8 = { enabled = true, executable = "pflake8"},
                -- linter options
                pylint = { enabled = false, executable = "pylint" },
                pyflakes = { enabled = false},
                pycodestyle = { enabled = false },
                -- type checker
                pylsp_mypy = { enabled = true, executable = "pylsp-mypy"},
                -- auto-completion options
                jedi_completion = { fuzzy = true },
                -- import sorting
                pyls_isort = { enabled = true },
            },
        },
    },
    flags = {
        debounce_text_changes = 200
    },
}


-- Lua LSP (if you need it)
lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

-- Copilot settings
vim.g.copilot_workspace_folders = {
    "/home/vilhelm/dev/rd/src/common/PlatformSpecific/python3/trablib",
    "/home/vilhelm/dev/CI/AllgonHILtestingLib",
    "/home/vilhelm/dev/CI/examples/catsintegration"
}
