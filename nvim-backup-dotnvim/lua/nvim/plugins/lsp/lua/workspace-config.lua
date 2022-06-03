local Lsp = require('nvim.utils.lsp')
local LspEventType = require('nvim.utils.lsp.event')

local M = {}

function M.setup()
    Lsp.add_listener(LspEventType.SERVER_SETUP, function(ls, conf)
        if ls == 'sumneko_lua' then
            conf:set_option('workspace', {
                maxPreload = 10000,
                preloadFileSize = 10000,
            })
        end
    end)
end

return M
