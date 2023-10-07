vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').toggle_breakpoint() end)
-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
	function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<leader><leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<leader><leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<leader><leader>dh', function()
	require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<leader><leader>dp', function()
	require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<leader><leader>df', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<leader><leader>ds', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.scopes)
end)

local dap = require('dap')
--dap.configuratlocal dap = require('dap')
dap.adapters.lldb = {
	type = 'executable',
	command = '/opt/homebrew/opt/llvm/bin/lldb-vscode', -- adjust as needed, must be absolute path
	name = 'lldb'
}
dap.configurations.cpp = {
	{
		name = 'Launch',
		type = 'lldb',
		request = 'launch',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},

		initCommands = function()
			-- Find out where to look for the pretty printer Python module
			local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))

			local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
			local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

			local commands = {}
			local file = io.open(commands_file, 'r')
			if file then
				for line in file:lines() do
					table.insert(commands, line)
				end
				file:close()
			end
			table.insert(commands, 1, script_import)

			return commands
		end,


		-- 💀
		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
		--
		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Otherwise you might get the following error:
		--
		--    Error on launch: Failed to attach to the target process
		--
		-- But you should be aware of the implications:
		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
		-- runInTerminal = false,
	},
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
