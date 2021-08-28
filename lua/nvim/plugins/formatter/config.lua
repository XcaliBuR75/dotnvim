local rockbin = require('packer.luarocks').get_bin_path()
local util = require('packer.util')
local file_util = require('nvim.utils.file')
local os_util = require('nvim.utils.os')
local list_util = require('nvim.utils.lua.list')

local luaformat = util.join_paths(rockbin, 'lua-format')

local prettier_formatter = function(...)
    local additional_args = {...}

    return function()
        local args = {
            '--stdin-filepath',
            API.nvim_buf_get_name(0),
            '--no-color',
            '--loglevel silent',
        }

        if additional_args then
            args = list_util.concat(args, additional_args)
        end

        local prettier_conf = nil

        os_util.run_on_os({
            linux = function()
                local home = os.getenv('HOME')
                prettier_conf = home .. '/.config/prettier/prettierrc.json'
            end,
            -- @TODO add pretteir conf for windows and mac
        })

        if file_util.exists(prettier_conf) then
            table.insert(args, '--config ' .. prettier_conf)
        end

        return {exe = 'prettier', args = args, stdin = true}
    end
end

require('formatter').setup({
    logging = false,
    filetype = {
        javascript = {prettier_formatter('--parser typescript')},
        java = {prettier_formatter('--parser java')},
        json = {prettier_formatter('--parser json')},
        rust = {
            function()
                return {exe = 'rustfmt', args = {'--emit=stdout'}, stdin = true}
            end,
        },
        lua = {function()
            return {exe = luaformat, args = {}, stdin = true}
        end},
        cpp = {
            function()
                return {
                    exe = 'clang-format',
                    args = {},
                    stdin = true,
                    cwd = FN.expand('%:p:h'),
                }
            end,
        },
    },
})
