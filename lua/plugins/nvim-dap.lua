return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            -- Configuração existente para .NET
            dap.adapters.coreclr = {
                type = "executable",
                command = "/home/vitor/.nix-profile/bin/netcoredbg",
                args = { "--interpreter=vscode" },
            }

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "Launch - netcoredbg",
                    request = "launch",
                    program = function()
                        local cwd = vim.fn.getcwd()
                        local dll = vim.fn.glob(cwd .. "/bin/Debug/**/*.dll")
                        if dll == "" then
                            vim.notify("Nenhum .dll encontrado em bin/Debug", vim.log.levels.ERROR)
                            return ""
                        end
                        return dll
                    end,
                },
            }

            -- Nova configuração para PHP com XDebug
            dap.adapters.php = {
                type = "executable",
                command = "node",
                args = { "/home/vitor/.nix-profile/lib/node_modules/vscode-php-debug/out/phpDebug.js" },
            }

            dap.configurations.php = {
                {
                    type = "php",
                    request = "launch",
                    name = "Listen for Xdebug",
                    port = 9003,
                    pathMappings = {
                        ["/var/www/html"] = "${workspaceFolder}",
                    },
                    -- Configuração do XDebug
                    xdebugSettings = {
                        max_children = 100,
                        max_data = 1024,
                        max_depth = 5,
                    },
                    log = true,
                    hostname = "localhost",
                },
                {
                    type = "php",
                    request = "launch",
                    name = "Launch PHP Script",
                    program = "${file}",
                    cwd = "${fileDirname}",
                    port = 9003,
                    runtimeExecutable = "php",
                },
            }
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()

            -- Auto open/close UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
}
