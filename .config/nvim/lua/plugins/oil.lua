vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
})

-- local hlgroups = {
--   "FloatBorder"
-- }
--
-- for _, group in ipairs(hlgroups) do
--   vim.api.nvim_set_hl(0, group, { link="Comment"  })
-- end

local oil = require("oil")
local detail = false
oil.setup({
  float = {
    padding = 2,
    border = "rounded",
    get_win_title = nil,
    preview_split = "right",
    override = function(conf)
      local title = "File Tree"
      conf.title = {
        { " ", "FloatBorder" },
        { " " .. title .." ", "FloatTitle" },
        { " ", "FloatBorder" }
      }
      conf.title_pos = "center"
      return conf
    end
  },
  keymaps = {
    ["gd"] = {
      desc = "Toggle file detail view",
      callback = function ()
        detail = not detail
        if detail then
          oil.set_columns({"icon", "permissions", "size", "mtime"})
        else
          oil.set_columns({ "icon" })
        end
      end
    }
  },
  win_options = {
    winbar = " %#CurSearch#%{substitute(v:lua.require('oil').get_current_dir(),'^' . $HOME, '~', '')}",
  }
})

vim.keymap.set("n", "<leader>-", "<cmd>Oil --float<cr>", { desc = "Open Oil File Explorer"})

