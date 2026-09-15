vim.pack.add({
 "https://github.com/FylerOrg/fyler.nvim",
 "https://github.com/nvim-mini/mini.icons"
})

local fyler = require("fyler")
fyler.setup({
  integrations = {
    icon = "mini_icons"
  },
  ui = {
    indent_guides = true 
  }
})

vim.keymap.set("n","<leader>e", function() 
  local buf_name = vim.api.nvim_buf_get_name(0):gsub("(.*)/.*$", "%1")
  fyler.open({ kind = "split_right_most", root_path = buf_name })
end, { desc="Toggle File Explorer - Buffer CWD" })

vim.keymap.set("n", "<leader>E", function () fyler.open({ kind = "split_right_most" }) end, { desc = "Toggle File Explorer - Terminal CWD" })
