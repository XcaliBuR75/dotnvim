local QueryManager = require('nvim.utils.treesitter.query-manager')

local qm = QueryManager('lua')

local M = {}

function M.setup()
    qm:add_query(
        'LuaSnip_FunctionParamNames',
        [[
            [
                (function_definition
                    (parameters
                        (identifier) @param))
                (function_declaration
                    (parameters
                        (identifier) @param))
            ]
        ]]
    )
end

return M
