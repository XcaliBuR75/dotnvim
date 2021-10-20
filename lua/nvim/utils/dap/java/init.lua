local dap = require 'dap'
local class = require 'pl.class'
local List = require 'pl.List'
local Promise = require 'promise'
local Command = require 'nvim.utils.lsp.java.command'
local ResolveClasspathArguments =
    require 'nvim.utils.lsp.java.command.arguments.resolve-classpath-arguments'
local FindTestTypesAndMethodsArguments =
    require 'nvim.utils.lsp.java.command.arguments.find-test-types-and-methods-arguments'

---@diagnostic disable-next-line: undefined-global
local v = vim
local loop = v.loop
local api = v.api

local JavaDap = class()

function JavaDap:_init()
    self.command = Command()
end

--- Start the debug session
-- @returns { Promise } promise with the port number
function JavaDap.start_debug_session(self)
    return self.command:start_debug_session()
end

--- Returns project name and classpaths for each and every main class
-- @returns { Promise } classpath information
function JavaDap.get_main_classes(self)
    return self.command:resolve_main_class():thenCall(
               function(main_classes)
            local main_class_list = List(main_classes)

            local resolve_classpath_promise_list = main_class_list:map(
                                                       function(main_class)

                    local project_name = main_class.projectName
                    local class_name = main_class.mainClass
                    local resolve_classpath_arguments = ResolveClasspathArguments(
                                                            project_name,
                                                            class_name)
                    return self.command:resolve_classpath(
                               resolve_classpath_arguments)
                end)

            return Promise.all(resolve_classpath_promise_list)
        end)
end

--- Creates a dap run configuration using the given information
function JavaDap.create_debug_config(self, project_name, class_name, classpath)
    return {
        name = string.format('Launch -> %s -> %s', project_name, class_name),
        projectName = project_name,
        mainClass = class_name,
        classPaths = V.tbl_flatten(classpath),
        modulePaths = {},
        request = 'launch',
        type = 'java',
    }
end

--- Returns the dap java configuration
-- @returns { Promise } dap configuration
function JavaDap.get_dap_config(self)
    self:get_main_classes():thenCall(
        function(classpaths)
            local classpath_list = List(classpaths)

            classpath_list:map(
                function(classpath_data)

                    local project_name = classpath_data.class_info.projectName
                    local class_name = classpath_data.class_info.mainClass
                    local classpath = classpath_data.class_path

                    return self:create_debug_config(
                               project_name, class_name, classpath)
                end)
        end)
end

function JavaDap.run_test_class(self, buffer)
    local find_test_arg = FindTestTypesAndMethodsArguments(buffer)

    self.command:find_test_types_and_methods(buffer, find_test_arg):thenCall(
        function(tests)
            local test_list = List(tests)
        end)
end

function JavaDap.run_current_test_class(self)
    local buffer = api.nvim_get_current_buf()
    self:run_test_class(buffer)
end

function JavaDap.run(self, buffer)
    local junit = require('jdtls.junit')

    local server = loop.new_tcp()
    local test_results = junit.mk_test_results(buffer)

    local before = function(conf)
        server:bind('127.0.0.1', 0)
        server:listen(
            128, function(err2)
                assert(not err2, err2)
                local sock = V.loop.new_tcp()
                server:accept(sock)
                sock:read_start(test_results.mk_reader(sock))
            end)
        conf.args = conf.args:gsub(
                        '-port ([0-9]+)', '-port ' .. server:getsockname().port);
        return conf
    end

    local after = function()
        server:shutdown()
        server:close()
        local items = test_results.show()
        -- M.maybe_repeat(lens, config, context, opts, items)
    end

    dap.run(self.config, { before = before, after = after })
end

return JavaDap
