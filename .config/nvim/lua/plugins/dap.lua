vim.pack.add({

	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/theHamsta/nvim-dap-virtual-text",
  "https://github.com/microsoft/vscode-js-debug"
})

local dap = require("dap")
local dapui = require("dapui")
local dapvt = require("nvim-dap-virtual-text")

dapui.setup({})
dapvt.setup({
	commented = true,
})

-- Debug Adapters
dap.adapters["pwa-node"] = {
  type="server",
  host="localhost",
  port="${port}",
  executable= {
    command = "node",
    args = {"$HOME/.local/bin/js-debug/src/dapDebugServer.js"}
  }
}

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = {os.getenv("HOME") .. ""}
}

-- Adapter Configs
dap.configurations.javascript = {
  {
    type="pwa-node",
    request="launch",
    name="Launch file",
    program="${file}",
    cwd="${workspaceFolder}"
  }
}

-- Adapter Listeners
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function ()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function ()
  dapui.close()
end
-- Keybinds
vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end, {})
vim.keymap.set("n", "<leader>fdb", "<CMD>FzfLua dap_breakpoints<CR>", { desc = "List Breakpoints" })
