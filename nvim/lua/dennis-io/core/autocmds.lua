local function open_qf_percent(percent)
	local height = math.floor(vim.o.lines * percent)
	vim.cmd(height .. "copen")
end

-- local function strip_ansi(s)
-- 	return s and s:gsub("\27%[[%d;]*[A-Za-z]", "")
-- end

-- agressive ANSI stripping that should work in most cases
-- local function strip_ansi(s)
-- 	return s and s:gsub("\27%[[0-9;?]*[%a]", "")
-- end

-- Remove *all* ANSI escape sequences (SGR, CSI, OSC, etc.)
-- local function strip_ansi(s)
-- 	if not s then
-- 		return ""
-- 	end
-- 	-- CSI (e.g. ESC [ ... letters)
-- 	s = s:gsub("\27%[[0-9;]*[A-Za-z]", "")
-- 	-- OSC (e.g. ESC ] ... BEL)
-- 	s = s:gsub("\27%].-\7", "")
-- 	-- Anything else starting with ESC
-- 	s = s:gsub("\27.", "")
-- 	return s
-- end

local function strip_ansi(s)
	if not s then
		return ""
	end
	return s:gsub("\27%[[0-9;?]*[ -/]*[@-~]", "")
end

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	pattern = "*",
	command = 'silent! normal! g`"zv',
})

vim.api.nvim_create_user_command("GitPattern", function(opts)
	local args = vim.split(opts.args, " ")
	local pattern = args[1]
	local start = args[2]
	local stop = args[3] or "HEAD"

	if not pattern or not start then
		print("Usage: :GitPatternQF <pattern> <start> [<end>]")
		return
	end

	local cmd = string.format("git log -G'%s' %s..%s --name-only --pretty=format: | sort -u", pattern, start, stop)
	local files = vim.fn.systemlist(cmd)

	if vim.v.shell_error ~= 0 then
		print("Git command failed.")
		return
	end

	local qf = {}
	for _, file in ipairs(files) do
		if file ~= "" then
			table.insert(qf, {
				filename = file,
				lnum = 1,
				col = 1,
				text = string.format("Pattern '%s' changed in range %s..%s", pattern, start, stop),
			})
		end
	end

	if #qf == 0 then
		print("No files found.")
		return
	end

	vim.fn.setqflist(qf, "r")
	vim.cmd("copen")
end, {
	nargs = "+",
	complete = nil,
	desc = "Search git diff for pattern changes in a commit range and add matching files to quickfix",
})

vim.api.nvim_create_user_command("Make", function(opts)
	local lines = {}
	local title = opts.args

	-- Start job
	vim.notify("Running: " .. title .. " …")

	vim.fn.jobstart(opts.args, {
		stdout_buffered = true,
		stderr_buffered = true,

		on_stdout = function(_, data)
			if data then
				for _, line in ipairs(data) do
					table.insert(lines, strip_ansi(line))
					-- table.insert(lines, line)
				end
			end
		end,

		on_stderr = function(_, data)
			if data then
				vim.list_extend(lines, data)
			end
		end,

		on_exit = function(_, code)
			-- Push into quickfix when done
			vim.schedule(function()
				vim.fn.setqflist({}, "r", { title = title, lines = lines })
				open_qf_percent(0.3)
				if code ~= 0 then
					vim.api.nvim_err_writeln("Command failed: " .. title)
				end
			end)
		end,
	})
end, {
	nargs = "+",
	complete = "shellcmd",
})
