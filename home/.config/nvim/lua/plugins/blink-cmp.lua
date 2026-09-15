vim.pack.add({
  'https://github.com/saghen/blink.lib',
  "https://github.com/saghen/blink.cmp"
})

local blink = require("blink.cmp")
local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  group = group,
 once = true,
 callback = function()
    blink.build():pwait()
    blink.setup({
      keymap = { preset = "default" },
      appearance = {
        nerd_font_variant = "mono",
        use_nvim_cmp_as_default = true,
      },
      completion = {
        documentation = { auto_show = false },
        menu = {
          border = "rounded"
        }
      },
      signature = {
        enabled = true,
        window = {
          border = "rounded"
        }
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    })
  end,
})

