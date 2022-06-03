local Lsp = require('nvim.utils.lsp')

local M = {}

local servers = {
    'bashls',
    'cssls',
    'dockerls',
    'eslint',
    'graphql',
    'html',
    'jsonls',
    'jdtls',
    'sumneko_lua',
    'pyright',
    'rust_analyzer',
    'tsserver',
    'volar',
    'groovyls',
    'clangd',
}

function M.setup()
    Lsp.setup(servers)
end

return M
