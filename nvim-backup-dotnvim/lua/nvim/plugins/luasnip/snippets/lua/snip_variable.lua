local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local SnippetManager = require('nvim.plugins.luasnip.snippet_manager')

local s = ls.s
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node

local sm = SnippetManager('lua')

-- creates a variable
sm:add_snippet(s(
    'v',
    fmt('{} = {}', {
        c(1, { fmt('local {}', { i(1) }), i(1) }),
        i(2),
    })
))

-- imports a module
sm:add_snippet(s(
    'i',
    fmt("local {} = require('{}')", {
        f(function(args)
            local import_parts = vim.split(args[1][1], '.', true)

            return import_parts[#import_parts] or ''
        end, { 1 }),
        i(1),
    })
))
