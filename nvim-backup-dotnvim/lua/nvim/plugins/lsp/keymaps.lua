local Lsp = require('nvim.utils.lsp')
local Event = require('nvim.utils.lsp.event')
local ConfEvent = require('nvim.utils.lsp.config.event')

local M = {}

function M.setup()
    Lsp.add_listener(Event.SERVER_SETUP, function(_, conf)
        conf:add_listener(ConfEvent.ATTACH, M.on_attach)
        return conf
    end)
end

return M

