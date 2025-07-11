return {
	"thehamsta/nvim-dap-virtual-text",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("nvim-dap-virtual-text").setup({
			enabled = true,
			highlight_changed_variables = true,
			highlight_new_as_changed = false,
			highlight_read_only = true,
			all_frames = false,
			virt_text_pos = "inline",
			all_frames = false,
			virt_lines = false,
			virt_text_win_col = nil,
		})
	end,
}
