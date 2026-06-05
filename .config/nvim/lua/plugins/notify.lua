vim.pack.add({ "https://github.com/nvim-mini/mini.notify"})

local notify = require("mini.notify")

local win_config = function()
  local has_statusline = vim.o.laststatus > 0
  local pad = vim.o.cmdheight + (has_statusline  and 1 or 0)

  return { anchor = "SE", col = vim.o.columns, row = vim.o.lines - pad }
end
notify.setup({
  content = {
      format = function (notif)
        if notif.data.source == "lsp_progress" then return notif.msg end
        local time = vim.fn.strftime('%I:%m %p',math.floor(notif.ts_update))
        return string.format('%s | %s', time, notif.msg)
      end,

  },
  window = {
    config = win_config
  }
})

