local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local lua_ts_utils = require('nvim.plugins.luasnip.snippets.lua.ts_utils')

local ts_query = vim.treesitter.query
local sn = ls.sn
local i = ls.insert_node
local t = ls.text_node

local M = {}

-- get_current_func_doc_comment_snip generates comment string snip
function M.get_current_func_doc_comment_snip()
    lua_ts_utils.refresh_syntax_tree()
    local function_node = lua_ts_utils.get_current_func_node()

    -- immediately return if function_node not found
    if not function_node then
        return sn(nil, t(''))
    end

    local param_name_query = vim.treesitter.get_query(
        'lua',
        'LuaSnip_FunctionParamNames'
    )

    local comment_lines = { '\n' }
    local snip_nodes = {}
    local index = 1

    for _, nodes, _ in param_name_query:iter_matches(function_node, 0) do
        for _, param_node in ipairs(nodes) do
            table.insert(
                comment_lines,
                string.format(
                    '-- @param {{ {} }} %s {}',
                    ts_query.get_node_text(param_node, 0)
                )
            )

            table.insert(snip_nodes, i(index, 'any'))
            table.insert(snip_nodes, i(index + 1, 'is a mysterious parameter'))

            index = index + 2
        end
    end

    -- if there are no param in the function, return nothing
    if #snip_nodes < 1 then
        return sn(nil, t(''))
    end

    local comment_str = table.concat(comment_lines, '\n')

    return sn(nil, fmt(comment_str, snip_nodes))
end

return M
