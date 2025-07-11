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
