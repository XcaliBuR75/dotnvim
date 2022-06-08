local FiletypeEvent = require('nvim.utils.nvim.filetype-event')

local snips = {
    lua = 'nvim.plugins.luasnip.snippets.lua',
    typescriptreact = 'nvim.plugins.luasnip.snippets.typescriptreact',
}

--[[
local M = {}

function M.setup()
    for filetype, snip_mod in pairs(snips) do
        FiletypeEvent.on_filetype_open(filetype, function()
            require(snip_mod)
        end)
    end
end

return M
--]]
