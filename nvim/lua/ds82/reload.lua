--- Reload the entire configuration
function reload_config()
	for name, _ in pairs(package.loaded) do
		if name:match('^ds82') then
			package.loaded[name] = nil
		end
	end

	require('ds82')

	-- Reload after/ directory
	local glob = vim.fn.stdpath('config') .. '/after/**/*.lua'
	local after_lua_filepaths = vim.fn.glob(glob, true, true)

	for _, filepath in ipairs(after_lua_filepaths) do
		dofile(filepath)
	end

	vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

vim.keymap.set('n', '<leader>1', reload_config)
vim.keymap.set("n", "<leader><leader>1", function()
	reload_config()
	vim.cmd.PackerSync();
end)
