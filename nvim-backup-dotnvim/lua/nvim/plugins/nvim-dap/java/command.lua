local Lsp = require('nvim.utils.lsp')
local Notify = require('nvim.utils.notify')
local Command = require('nvim.utils.nvim.command')
local DapCommands = require('nvim.plugins.nvim-dap.java.commands')
local LspEventType = require('nvim.utils.lsp.event')
local ConfEventType = require('nvim.utils.lsp.config.event')

local notify = Notify({ title = 'Java Testing' })

local M = {}

function M.setup_commands(_, _)
    Command:is_buffer_cmd(true):add_all({
        {
            name = 'RunTestClass',
            action = function()
                DapCommands.run_current_test_class():catch(function(err)
                    notify:error(err.message or err)
                end)
            end,
        },
        {
            name = 'RunTestOnCursor',
            action = function()
                DapCommands.run_current_test_on_cursor():catch(function(err)
                    notify:error(err.message or err)
                end)
            end,
        },
        {
            name = 'ShowResults',
            action = function()
                DapCommands.show_results()
            end,
        },
    })
end

function M.setup()
    Lsp.add_listener(LspEventType.SERVER_SETUP, function(ls, conf)
        if ls == 'jdtls' then
            conf:add_listener(ConfEventType.ATTACH, M.setup_commands)
        end
    end)
end

return M
