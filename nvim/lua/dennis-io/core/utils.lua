local M = {}

-- Basic path extractors; tweak or add patterns for your log format
local patterns = {
	-- quoted absolute or relative
	[["([%w%._%-/\\]+%.[%w_]+)"]],
	-- bare path ending with an extension
	[[([%w%._%-/\\]+%.[%w_]+)]],
}

-- Resolve a path relative to current buffer dir if not absolute
function M.to_abs(path)
	if vim.loop.os_uname().sysname:match("Windows") then
		if path:match("^%a:[/\\]") or path:match("^[/\\][/\\]") then
			return path
		end
	else
		if path:sub(1, 1) == "/" then
			return path
		end
	end
	local cur = vim.api.nvim_buf_get_name(0)
	local dir = vim.fn.fnamemodify(cur, ":h")
	return vim.fn.fnamemodify(dir .. "/" .. path, ":p")
end

function M.extract_path_from_line(line)
	for _, pat in ipairs(patterns) do
		local m = line:match(pat)
		if m then
			return m
		end
	end
end

function M.strip_leading_relatives(p)
	-- Strip all leading "./" and "../" segments, regardless of count
	-- Do it in a loop because Lua patterns have no alternation or atomic groups
	while true do
		local before = p
		p = p:gsub("^%./+", "") -- remove any run of "./" at the start [web:23][web:51]
		p = p:gsub("^%.%./+", "") -- remove any run of "../" at the start [web:23][web:51]
		if p == before then
			break
		end
	end
	return p
end

return M
