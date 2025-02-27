return {
    {
        "mfussenegger/nvim-dap",
        lazy = false,
        config = function()
            local dap = require("dap")
            local setMap = vim.keymap.set

            dap.adapters.codelldb = {
                type = 'server',
                port = '${port}',
                executable = {
                    command = "codelldb",
                    args = {"--port", "${port}"},
                }
            }

            dap.configurations.zig = {
                {
                    name = "Launch Zig",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/main", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    console = "integratedTerminal",
                },
            }

            setMap("n", "<leader>dc", dap.continue, {desc = "DAP: Continue" })
            setMap("n", "<leader>ds", dap.step_into, {desc = "DAP: Step Into" })
            setMap("n", "<leader>dr", dap.repl.open, {desc = "DAP: Open REPL" })
            setMap("n", "<leader>db", dap.toggle_breakpoint, {desc = "DAP: Basic Set Breakpoint"})
            setMap("n", "<leader>dB", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint Condition: "))
            end, {desc = "DAP: Set Conditional Breakpoint"})
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {"williamboman/mason.nvim", "mfussenegger/nvim-dap"},
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = {
                    "delve", -- Go
                    "codelldb" -- C, Zig, Rust
                },
                automatic_installation = true,
                handlers = {},
            })
        end
    }
}
