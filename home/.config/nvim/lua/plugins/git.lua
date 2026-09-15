vim.pack.add({
  "https://github.com/kdheepak/lazygit.nvim",
	"https://github.com/lewis6991/gitsigns.nvim", 
  "https://github.com/esmuellert/codediff.nvim",
})

local git = require("gitsigns")

git.setup({
  signs = {
    add = { text = " ▎" },
    change = { text = " ▎" },
    delete = { text = " " },
    topdelete = { text = " " },
    changedelete = { text = " ~" },
    untracked = { text = " ┆" },
  },
  signs_staged = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 800,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = "<author>, <author_time:%R> - <summary> (<abbrev_sha>)",
})

local codediff = require("codediff")

codediff.setup({})
vim.keymap.set('n', '<leader>ru', '<cmd>CodeDiff<cr>', { desc = 'Code diff not staged' })
vim.keymap.set('n', '<leader>rm', '<cmd>CodeDiff main<cr>', { desc = 'Code diff main' })
vim.keymap.set('n', '<leader>rh', '<cmd>CodeDiff HEAD~1<cr>', { desc = 'Code diff previous commit' })

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
vim.keymap.set('n', '<leader>gb', function() vim.ui.open(vim.fn.systemlist('git remote get-url origin')[1]) end, { desc = 'Open git remote' })
