local JavaDap = require('nvim.utils.dap.java')
local TestResult = require('nvim.utils.ui.test.test-result')

local dap = JavaDap()

local M = {
    history = {},
}

function M.run_current_test_on_cursor()
    return dap:run_current_test_on_cursor():thenCall(function(test_result_sub)
        local test_result = TestResult(test_result_sub)
        table.insert(M.history, test_result)
    end)
end

function M.run_current_test_class()
    return dap:run_current_test_class():thenCall(function(test_result_sub)
        local test_result = TestResult(test_result_sub)
        table.insert(M.history, test_result)
    end)
end

function M.show_results()
    if M.history[#M.history] then
        M.history[#M.history]:show()
    end
end

return M
