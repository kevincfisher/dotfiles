vim.cmd('syntax off')

	local function maybe_archive_lsp_log()
	local log_path = vim.lsp.log.get_filename()
	local stat = vim.uv.fs_stat(log_path)
	if not stat then
		return
	end
local size_mb = stat.size / (1024 * 1024)
	if size_mb < 100 then
		return
	end

	vim.ui.select({ "Yes, compress it", "No, leave it" }, {
		prompt = string.format("lsp.log is %.0f MB — archive it?", size_mb),
	}, function(choice)
		if choice ~= "Yes, compress it" then
			return
		end

		local archive = log_path .. "." .. os.date("%Y%m%d_%H%M%S") .. ".gz"
		local notify = require("mini.notify")
		local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
		local frame = 1
		local notif_id = notify.add(spinners[frame] .. " Archiving lsp.log…", vim.log.levels.INFO)

		local timer = vim.uv.new_timer()
		if timer then
			timer:start(
				100,
				100,
				vim.schedule_wrap(function()
					frame = (frame % #spinners) + 1
					notify.update(notif_id, { msg = spinners[frame] .. " Archiving lsp.log…" })
				end)
			)
			vim.fn.jobstart(
				{ "sh", "-c", string.format("gzip -c %q > %q && truncate -s 0 %q", log_path, archive, log_path) },
				{
					on_exit = function(_, code)
						timer:stop()
						timer:close()
						if code == 0 then
							notify.update(notif_id, { msg = "✓ lsp.log archived → " .. vim.fn.fnamemodify(archive, ":t") })
						else
							notify.update(
								notif_id,
								{ msg = "✗ lsp.log archival failed (exit " .. code .. ")", level = vim.log.levels.WARN }
							)
						end
					end,
				}
			)
		end
	end)
end

vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function() vim.highlight.on_yank() end
})

