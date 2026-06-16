local string_utils = require("utils.strings")
local M = {}

M._NOW = os.time()
-- Get the current time of day
-- @return string - Morning, Afternoon, Evening, Night
M.get_hour = function()
	local current_hour = os.date("*t", M._NOW)
	return current_hour.hour
end

M.get_kitchen_time = function()
	local kitchen_time = os.date("%I:%M %p", M._NOW)
	if string_utils.starts_with(kitchen_time, "0") then
		kitchen_time = string.sub(kitchen_time, 2)
	end
	return kitchen_time
end

-- Get the full calendar date e.g. Sunday, January 2, 2026
M.get_full_calendar_date = function()
	return os.date("%A, %B ", M._NOW)
end

return M
