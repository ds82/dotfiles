return {
	"mfussenegger/nvim-dap",
	event = { "VimEnter" },
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local mason_registry = require("mason-registry")

		local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
		local codelldb_path = codelldb_root .. "adapter/codelldb"
		local liblldb_path = codelldb_root .. "lldb/lib/liblldb"
		local this_os = vim.loop.os_uname().sysname
		liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")

		vim.keymap.set("n", "<F5>", function()
			dap.continue()
		end)
		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end)
		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end)
		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end)
		vim.keymap.set("n", "<Leader>B", function()
			dap.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)
		vim.keymap.set("n", "<leader><leader>dr", function()
			dap.repl.open()
		end)
		vim.keymap.set("n", "<leader><leader>dl", function()
			dap.run_last()
		end)
		vim.keymap.set({ "n", "v" }, "<leader><leader>dh", function()
			require("dap.ui.widgets").hover()
		end)
		vim.keymap.set({ "n", "v" }, "<leader><leader>dp", function()
			require("dap.ui.widgets").preview()
		end)
		vim.keymap.set("n", "<leader><leader>df", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end)

		vim.keymap.set("n", "<leader><leader>ds", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end)

		vim.keymap.set("n", "<leader><leader>dd", function()
			require("dapui").toggle()
		end)

		--
		-- ui
		--
		local dapui = require("dapui")
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
			mappings = {
				-- Use a table to apply multiple mappings
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			-- Expand lines larger than the window
			-- Requires >= 0.7
			expand_lines = vim.fn.has("nvim-0.7") == 1,
			-- Layouts define sections of the screen to place windows.
			-- The position can be "left", "right", "top" or "bottom".
			-- The size specifies the height/width depending on position. It can be an Int
			-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
			-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
			-- Elements are the elements shown in the layout (in order).
			-- Layouts are opened in order so that earlier layouts take priority in window sizing.
			layouts = {
				{
					elements = {
						-- Elements can be strings or table with id and size keys.
						"breakpoints",
						"stacks",
						"watches",
						{ id = "scopes", size = 0.25 },
					},
					size = 40, -- 40 columns
					position = "left",
				},
				{
					elements = {
						"repl",
						"console",
					},
					size = 0.25, -- 25% of total lines
					position = "bottom",
				},
			},
			controls = {
				-- Requires Neovim nightly (or 0.8 when released)
				enabled = true,
				-- Display controls in this element
				element = "repl",
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "↻",
					terminate = "□",
				},
			},
			floating = {
				max_height = nil, -- These can be integers or a float between 0 and 1.
				max_width = nil, -- Floats will be treated as percentage of your screen.
				border = "single", -- Border style. Can be "single", "double" or "rounded"
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			windows = { indent = 1 },
			render = {
				max_type_length = nil, -- Can be integer or nil.
				max_value_lines = 100, -- Can be integer or nil.
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		-- dap.adapters.lldb = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
		-- dap.adapters.rust = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
		--
		dap.configurations.rust = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {
					port = 0,
				},

				runInTerminal = true,
			},
		}
	end,
}
