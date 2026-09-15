local map = vim.keymap.set

vim.api.nvim_set_hl(0, "DapBreakpointSign", { fg = "#ff0000", bg = nil, bold = true })
vim.fn.sign_define("DapBreakpoint", {
	text = "●",
	texthl = "DapBreakpointSign",
	linehl = "",
	numhl = "",
})

local sev = vim.diagnostic.severity

vim.diagnostic.config({
	-- keep underline & severity sort on for quick-scanning
	underline = true,
	severity_sort = true,
	update_in_insert = false,
	float = {
		border = "rounded",
		source = true,
	},

	-- keep signs and virtual text, but tune them as you like
	signs = {
		text = {
			[sev.ERROR] = " ",
			[sev.WARN] = " ",
			[sev.INFO] = " ",
			[sev.HINT] = " 󰌵",
		},
	},
	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "●",
	},
	linehl = {
		[sev.ERROR] = "DiagnosticError",
	},
})

--diagnostic keymaps
local diagnostic_goto = function(next, severity)
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		vim.diagnostic.jump({ count = next and 1 or -1, severity = severity })
	end
end

map("n", "<leader>dc", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Previous Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Previous Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Previous Warning" })
