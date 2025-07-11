-- quickly insert logfiles into code
-- https://github.com/Goose97/timber.nvim
--
-- insert_log_below	glj	Insert a log statement below the cursor
-- insert_log_above	glk	Insert a log statement above the cursor
-- insert_plain_log_below	glo	Insert a plain log statement below the cursor
-- insert_plain_log_above	gl<S-o>	Insert a plain log statement above the cursor
-- add_log_targets_to_batch	gla	Add a log target to the batch
-- insert_batch_log	glb	Insert a batch log statement
--
return {
	"Goose97/timber.nvim",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("timber").setup({})
	end,
}
