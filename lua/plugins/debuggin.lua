return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
  },

  config = function()
    local dap = require("dap")
    local dapui = require("dap")

    vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<leader>dc", dap.continue, {})

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "9229",
      executable = {
        command = "node",
        args = { "~/bin/js-debug/src/dapDebugServer.js", "9229" },
      },
    }

    dap.configurations.typescript = {
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        port = 9229,
      },
    }

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
}
