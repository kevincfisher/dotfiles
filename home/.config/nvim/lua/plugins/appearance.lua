vim.pack.add({
  { src="https://github.com/rose-pine/neovim", name="rose-pine" },
  "https://github.com/nvim-mini/mini.icons",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/mawkler/modicator.nvim",
  "https://github.com/akinsho/bufferline.nvim",
})

require("mini.icons").setup()

require("rose-pine").setup({ styles = { transparency = true } })
vim.cmd("colorscheme rose-pine")

require("lualine").setup({
theme = "rose-pine"
})

require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, _, _)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
  },
})

require("modicator").setup({
  show_warnings = true,
  highlights = {
    defaults = {
      bold = true
    }
  },
  integration = {
    lualine = {
      mode_section = "a"
    }
  }
})

