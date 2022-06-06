local Lsp = require('nvim.utils.lsp')
local LspEvent = require('nvim.utils.lsp.event')
local ConfEvent = require('nvim.utils.lsp.config.event')
local Notify = require('nvim.utils.notify')

local notify = Notify({
    title = 'Language Server',
})

local M = {}

--- Showing notification on server ready
--
-- @param { string } lang - name of the language
function M.lsp_setup_message(lang)
    return function()
        notify:success('Language server:' .. lang .. ' is ready!')
    end
end

function M.setup()
    Lsp.add_listener(LspEvent.SERVER_SETUP, function(ls, conf)
        conf:add_listener(ConfEvent.SERVER_READY, M.lsp_setup_message(ls))
    end)
end

return M
