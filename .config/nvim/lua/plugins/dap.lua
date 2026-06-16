vim.pack.add({
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/theHamsta/nvim-dap-virtual-text"
})

local dap = require("dap")
local dapui = require("nvim-dap-ui")
local dapvt = require("nvim-dap-virtual-text")

dap.setup({})
dapui.setup({})
dapvt.setup({
  commented = true
})

-- Keybinds
