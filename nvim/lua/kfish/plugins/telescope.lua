return {
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      telescope.setup()
      -- load telescope-fzf-native
      require('telescope').load_extension('fzf')

      -- keymaps -- pickers
       vim.keymap.set('n', '<leader>ff', builtin.find_files)
       vim.keymap.set('n', '<leader>fg', builtin.git_files)
       vim.keymap.set('n', '<leader>gs', builtin.grep_string)
       vim.keymap.set('n', '<leader>lg', builtin.live_grep)

       vim.keymap.set('n', '<leader>fc', function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config Files" })
    end
  }
}
