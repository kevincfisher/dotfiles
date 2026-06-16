local opt = vim.opt
-- Set Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 10
opt.sidescrolloff = 8

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- better search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Visual config
opt.termguicolors = true
opt.signcolumn = "yes"
opt.showmatch = true
opt.matchtime = 2
opt.cmdheight = 0
opt.showmode = false
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2
opt.concealcursor = ""
opt.synmaxcol = 300
opt.ruler = false
opt.virtualedit = "block"
opt.winminwidth = 5

-- File Handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undolevels = 10000
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.updatetime = 300
opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.ttimeoutlen = 0
opt.autoread = true
opt.autowrite = true 

-- Editor Behaviors
opt.hidden = true
opt.errorbells = false 
opt.backspace = "indent,eol,start"
opt.autochdir = false
opt.iskeyword:append("-")
opt.path:append("**")
opt.selection = "exclusive"
opt.mouse = "a"
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.modifiable = true
opt.confirm = true
opt.encoding = "UTF-8"

-- fold settings
opt.smoothscroll = true
vim.wo.foldmethod = "expr"
opt.foldlevel = 99
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- Split behavior
opt.splitbelow = true
opt.splitright = true 
opt.splitkeep = "screen"

-- command-line completion
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignore:append({"*.o", "*.obj", "*.pyc", "*.class", "*.jar"})

--better diffs
opt.diffopt:append("linematch:60")

-- perf improvements
opt.redrawtime = 10000
opt.maxmempattern = 20000

local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

vim.g.autoformat = true
vim.g.trouble_lualine = true

opt.fillchars = {
  foldopen = "△",
  foldclose = "▽",
  fold = " ",
  foldsep = " ",
  diff = "/",
  eob = " "
}

opt.jumpoptions = "view"
opt.laststatus = 3
opt.list = false
opt.linebreak = true
opt.list = true
opt.shiftround = true -- round nearest shiftwidth increment (
opt.shiftwidth = 2
opt.shortmess:append({ W = true, I = true, c = true, C = true }) --disable some system messages

vim.g.markdown_recommended_style = 0

-- additional file support 
vim.filetype.add({
  extension = {
    env = "dotenv",
  },
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv"
  },
  pattern = {
    ["[jt]sconfig.*.json"] = "jsonc",
    ["%.env%.[%w_.-]+"] = "dotenv"
  },
})

local normal_hl = vim.api.nvim_get_hl(0, {name = "Normal"})
local transparent_hl = vim.tbl_extend("force", normal_hl, { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "Normal", transparent_hl)

vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function() vim.highlight.on_yank() end
})
