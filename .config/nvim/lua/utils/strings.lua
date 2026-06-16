--- string utility functions
--- @module "utils.strings"

local M = {}

M.starts_with = function (str, start)
  return str:sub(1, #start) == start
end

M.pad_to_equal_width = function(strings, fill_char)
 fill_char = fill_char or " "
 local maxlen = 0
 for _,s in ipairs(strings) do
   local l = #s
   if l > maxlen then maxlen = l end
 end
 local out = {}
 for i, s in ipairs(strings) do
   local dist_from_max = maxlen - #s
   local left_pad = math.floor(dist_from_max/2)
   local right_pad = dist_from_max - left_pad
   out[i] = string.rep(fill_char, left_pad) .. s .. string.rep(fill_char,right_pad)
 end
 return out, maxlen
end

return M
