local lsp_install = require('nvim-lsp-installer')

local M = {}

function M.setup()
    lsp_install.setup({
        automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
        ui = {
            icons = {
                server_installed = '✓',
                server_pending = '➜',
                server_uninstalled = '✗',
            },
        },
    })
end

return M
