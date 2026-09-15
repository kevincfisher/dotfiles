vim.pack.add({
  { src="https://github.com/rose-pine/neovim", name="rose-pine" },
  "https://github.com/kyazdani42/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/mawkler/modicator.nvim"
})

require("rose-pine").setup({ styles = { transparency = true } })
vim.cmd("colorscheme rose-pine")

require("lualine").setup({
theme = "rose-pine"
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

