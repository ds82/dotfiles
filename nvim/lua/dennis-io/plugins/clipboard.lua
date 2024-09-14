return {
	"ojroques/nvim-osc52",
	event = "VeryLazy",
	lazy = false,
	opts = function()
		local osc52 = require("osc52")

		osc52.setup({
			max_length = 0, -- Maximum length of selection (0 for no limit)
			silent = true, -- Disable message on successful copy
			trim = false, -- Trim surrounding whitespaces before copy
		})

		local function copy(lines, _)
			osc52.copy(table.concat(lines, "\n"))
			if vim.fn.has("macunix") then
				vim.fn.systemlist("pbcopy", lines)
			end
		end

		local function paste()
			return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
		end

		vim.g.clipboard = {
			name = "osc52",
			copy = {
				["+"] = copy,
				["*"] = copy,
			},
			paste = {
				["+"] = paste,
				["*"] = paste,
			},
		}
		vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

		vim.keymap.set("n", "<leader>G", function()
			copy({ vim.fn.expand("%:t") })
			print("Copied name of file to clipboard")
		end, { desc = "Copy current file name to clipboard" })

		vim.keymap.set("n", "<leader><leader>G", function()
			copy({ vim.fn.expand("%:p") })
			print("Copied path of file to clipboard")
		end, { desc = "Copy current file path to clipboard" })
	end,
}
