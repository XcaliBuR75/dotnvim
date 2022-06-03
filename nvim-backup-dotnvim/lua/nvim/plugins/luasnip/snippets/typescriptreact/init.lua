local ls = require('luasnip')
local su = require('nvim.utils.lua.string')

-- snippet creator
-- s(<trigger>, <nodes>)
local s = ls.s

-- snippet node
-- sn(<snippet>, <node>)
-- local sn = ls.sn

-- use the cotent from node at <position>
-- rep(<position>)
local rep = require('luasnip.extras').rep

-- formatter
-- fmt(<fmt_string>, {... nodes})
local fmt = require('luasnip.extras.fmt').fmt

-- different types of nodes
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local f = ls.function_node

-- d(<position>, <function() -> ls.sn>)
-- local d = ls.dynamic_node

local tl = su.box_trim_lines

local tabstop = su.get_space_str(vim.opt.tabstop:get())

local M = {}

function M.setup()
    ls.snippets.typescriptreact = {
        -- console.<type>
        s(
            'so',
            fmt('console.{}', {
                c(1, {
                    fmt('log({})', { i(1) }),
                    fmt('debug({})', { i(1) }),
                    fmt('error({})', { i(1) }),
                    fmt('warn({})', { i(1) }),
                }),
            })
        ),

        -- variables
        s(
            'var',
            fmt('{} = {}', {
                c(1, {
                    fmt('const {}', { i(1) }),
                    fmt('let {}', { i(1) }),
                }),
                i(2),
            })
        ),

        -- function
        s(
            'fn',
            fmt(
                tl([[
                    {}: {} => {{
                        {}{}
                    }}
                ]]),
                {
                    c(1, {
                        fmt('({})', { i(1) }),
                        fmt('const {} = ({})', { i(1), i(2) }),
                        fmt('let {} = ({})', { i(1), i(2) }),
                    }),
                    i(2, 'void'),
                    t(tabstop),
                    i(3),
                }
            )
        ),

        -- function
        s(
            'fnc',
            fmt(
                tl([[
                    {}({}): {} {{
                        {}{}
                    }}
                ]]),
                {
                    c(1, {
                        fmt('function {}', { i(1) }),
                        fmt('const {} = function', { i(1) }),
                        fmt('let {} = function', { i(1) }),
                    }),

                    i(2),
                    i(3),
                    t(tabstop),
                    i(4),
                }
            )
        ),
    }
end

return M
