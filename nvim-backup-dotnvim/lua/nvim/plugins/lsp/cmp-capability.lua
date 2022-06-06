local Lsp = require('nvim.utils.lsp')
local LspEventType = require('nvim.utils.lsp.event')

local M = {}

function M.setup()
    Lsp.add_listener(LspEventType.SERVER_SETUP, function(_, conf)
        local capabilities = require('cmp_nvim_lsp').update_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        )

        conf:set_option('capabilities', capabilities)
    end)
end

return M
