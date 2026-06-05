vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Create a sessions directory if it doesn't exist
local session_dir = vim.fn.stdpath("data") .. "/sessions/"
if vim.fn.isdirectory(session_dir) == 0 then
	vim.fn.mkdir(session_dir, "p")
end

local function get_session_file()
	local cwd = vim.fn.getcwd()
	local session_name = cwd:gsub("/", "%%")
	return session_dir .. session_name .. ".vim"
end

local function get_last_session_file()
	return session_dir .. "last_session.vim"
end

-- SessionLoadPre - close stale plugin floats before session restore
-- Skip ui2 internal windows (filetype: cmd/msg/pager/dialog) of LSP floats
local _ui2_ft = { cmd = true, msg = true, pager = true, dialog = true }
vim.api.nvim_create_autocmd("SessionLoadPre", {
	callback = function()
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			if vim.api.nvim_win_get_config(win).relative ~= "" then
				local ft = vim.bo[vim.api.nvim_win_get_buf(win)].filetype
				if not _ui2_ft[ft] then
					pcall(vim.api.nvim_win_close, win, true)
				end
			end
		end
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- Only restore if no files were specified
		if vim.fn.argc() == 0 then
			local session_file = get_last_session_file()
			if vim.fn.filereadable(session_file) == 1 then
				vim.cmd("silent! source " .. session_file)
				vim.cmd("source " .. vim.fn.fnameescape(session_file))
			end
		end
	end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		local stop_file = session_dir .. ".stop_saving"
		if vim.fn.filereadable(stop_file) == 1 then
			vim.fn.delete(stop_file)
			return
		end

		-- Only save if we have actual file buffers
		local buf_count = 0
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= "" then
				buf_count = buf_count + 1
			end
		end

		if buf_count >= 1 then -- min one buffer
			local session_file = get_session_file()
			vim.cmd("mksession! " .. vim.fn.nameescape(session_file))
			vim.cmd("mksession! " .. vim.fn.nameescape(get_last_session_file()))
		end
	end,
})

-- Load session for current directory
vim.keymap.set("n", "<leader>qs", function()
	local session_file = get_session_file()
	if vim.fn.filereadable(session_file) == 1 then
		vim.cmd("source " .. vim.fn.fnameescape(session_file))
	else
		vim.notify("No session found for current directory", vim.log.levels.WARN, { title = "Session Not Found" })
	end
end, { desc = "Load session for current directory"})
