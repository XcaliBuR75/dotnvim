local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = true,
    sources = {
        -- formatters
        formatting.prettier,
        formatting.stylua,
        formatting.autopep8,
        formatting.taplo,

        -- diagnostics
        -- diagnostics.cspell.with({
            -- filetypes = {
                -- 'lua',
                -- 'rust',
                -- 'javascript',
                -- 'typescript',
                -- 'reactjavascript',
                -- 'reacttypescript',
                -- 'python',
            -- },
            -- method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
            -- fallback_severity = vim.diagnostic.severity.HINT,
            -- severity = vim.diagnostic.severity.HINT,
        -- }),
    },
})
