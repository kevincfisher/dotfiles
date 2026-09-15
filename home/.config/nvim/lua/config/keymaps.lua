local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- === Buffer Navigation ===
map("n", "<Tab>", ":bnext<CR>", { desc = "Next Buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous Buffer"})

map("n", "<leader>bn", ":bnext<CR>", { desc = "Next Buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous Buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Quick switch to last edited file
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>b`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- === Window Management ===

--- Move between windows with hjkl 
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true})
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Window resizing ---
map("n", "<C-S-Up>", "<cmd>resize +5<CR>", opts)
map("n", "<C-S-Down>", "<cmd>resize -5<CR>", opts)
map("n", "<C-S-Left>", "<cmd>vertical resize +5<CR>", opts)
map("n", "<C-S-Right>", "<cmd>vertical resize -5<CR>", opts)

-- Window Splitting --
map("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>sh", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>sv", "<C-W>v", { desc = "Split Window Right", remap = true })

-- ======================
-- SMART LINE MOVEMENT
-- ======================

--- smart j/k: moves by visual lines when no count, real lines with count
map({"n", "x"}, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({"n", "x"}, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({"n","x"}, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({"n", "x"}, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move lines up/down (Alt+j/k)
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>=='", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up"})

-- Alt line moves for Alt-unsupported
map("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move Block Down" })
map("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move Block Up" })
map("n", "<A-Down>", ":m .+1<CR>", opts)
map("n", "<A-Up>", ":m .-2<CR>", opts)
map("i", "<A-Down>","<Esc>:m .+1<CR>gi=gi", opts)
map("i", "<A-Up>", "<Esc>:m .-2<CR>gi=gi", opts)
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)

-- =====================
-- Search & Nav improvements
-- =====================

-- better line start/end
map("n", "gl", "$", { desc = "Goto End of Line" })
map("n", "gh", "^", { desc = "Goto Start of Line" })
map("n", "<A-h>", "^", { desc = "Goto Start of Line", silent = true })
map("n", "<A-l>", "$", { desc = "Goto End of Line", silent = true })

-- Select all Content
map("n", "==", "gg<S-v>G")
map("n", "<A-a>", "ggVG", { noremap = true, silent = true, desc = "Select All" })

-- Clear all search highlight
map({"i", "n"}, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map("n", "<leader>ur", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", { desc = "Redraw / Clear hlsearch / Diff update" })

-- Smart Search nav (n = forward, N = backward)
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Previous Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Previous Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Previous Search Result" })

--===================
-- Smart Text Editing
--==================

--better indenting (stay in Visual Mode)
map("v", "<", "<gv")
map("v", ">", ">gv")

--better paste (doesn't replace clipboard with deleted text
map("v", "p", "_dP", opts)

-- Copy whole file to clipboard
map("n", "<C-c>", ":%y+<CR>", opts)

-- smart undo breakpoints (creates undo points at logical stops
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")



--================
-- File Operations
--================

-- Save file (all modes)
map({"i", "x", "n", "s"}, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Create new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Quit operations
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- ==================
-- Development tools
-- ==================

-- Commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- Quickfix and Location Lists
map("n", "<leader>xl", function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~=0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Location List" })

map("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0}).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List"})

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- Inspection Tools
map("n", "<leader>ui", vim.show_pos , { desc = "Inspect Pos"})
map("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

--Keyword program
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- ====================
-- Terminal Integration
-- ====================

-- Terminal Mode navigation

map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- =================
-- Tab Management
-- =================
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- ==================
-- Folding Navigation
-- ==================

map("n", "zv", "zMzvzz", { desc = "Close all folds except current" })

map("n", "zj", "zcjOzz", { desc = "Close current fold when open. Always open next fold" })
map("n", "zk", "zckzOzz", { desc = "Close current fold when open. Always open previous fold" })

-- =================
-- Utilities
-- ================

map("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle Line Wrap", silent = true })

--Fix spelling
map("n", "z0", "1z=", { desc = "Fix word under cursor" })
