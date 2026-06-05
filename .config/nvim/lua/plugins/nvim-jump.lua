vim.pack.add({
  "https://github.com/yorickpeterse/nvim-jump"
})

local jump = require("jump")

jump.setup()

for _, key in ipairs({ "s", "f", "t" }) do
  vim.keymap.set({ "n", "x", "o" }, key, require("jump").start)
end
