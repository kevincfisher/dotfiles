vim.pack.add({
  "https://github.com/folke/persistence.nvim"
})

local persistence = require("persistence")

vim.keymap.set("n", "<leader>qs", function () persistence.load() end, { desc="Load Session (CWD)" })
vim.keymap.set("n", "<leader>qS", function () persistence.select() end, { desc="Select Session" })
vim.keymap.set("n", "<leader>ql", function () persistence.load({ last = true }) end, { desc="Load Last Session" })
vim.keymap.set("n", "<leader>qd", function () persistence.stop() end, { desc="Stop Session" })
