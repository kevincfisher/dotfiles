vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- Better term escape
keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
keymap.set({ "t", "i" }, "<A-h>", "<C-\\><C-n><C-w>h")
keymap.set({ "t", "i" }, "<A-j>", "<C-\\><C-n><C-w>j")
keymap.set({ "t", "i" }, "<A-k>", "<C-\\><C-n><C-w>k")
keymap.set({ "t", "i" }, "<A-l>", "<C-\\><C-n><C-w>l")
keymap.set({ "n" }, "<A-h>", "<C-w>h")
keymap.set({ "n" }, "<A-j>", "<C-w>j")
keymap.set({ "n" }, "<A-k>", "<C-w>k")
keymap.set({ "n" }, "<A-l>", "<C-w>l")

keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })

keymap.set("n", "J", "mzJ`z", { desc = "Join with line below" })

-- Tab Management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new Tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close Current Tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Goto Next Tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Goto Previous Tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open Current Tab in New Tab" })

-- Window Management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Copy filepath to clipboard
keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~")
	vim.fn.setreg("+", filePath)
	vim.notify(filePath .. " copied to clipboard")
end, { desc = "Copy file path to clipboard" })
