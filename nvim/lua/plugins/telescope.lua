return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local themes = require("telescope.themes")
			local actions = require("telescope.actions")

			local keymap = vim.keymap.set

			keymap("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
			keymap("n", "<leader>/", builtin.buffers, { desc = "[/] Find in existing buffers" })
			keymap("n", "<leader>f", function()
				builtin.current_buffer_fuzzy_find(themes.get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer]" })

			keymap("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			keymap("n", "<C-p>", builtin.find_files, { desc = "[S]earch [F]iles" })
			keymap("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			keymap("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			keymap("n", "<leader>sa", builtin.live_grep, { desc = "[S]earch [A]ll" })
			keymap("n", "<leader>d", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })

			-- Lsp References rely on LSP Configuration
			keymap("n", "gr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })

			-- TODO: Try to move this to specific function
			telescope.setup({
				defaults = {
					prompt_prefix = " ",
					selection_caret = " ",
					path_display = { "smart" },
					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-c>"] = actions.close,
							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,
							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,
							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.complete_tag,
							["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
						},
						n = {
							["<esc>"] = actions.close,
							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["H"] = actions.move_to_top,
							["M"] = actions.move_to_middle,
							["L"] = actions.move_to_bottom,
							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["gg"] = actions.move_to_top,
							["G"] = actions.move_to_bottom,
							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,
							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,
							["?"] = actions.which_key,
						},
					},
				},
			})

			-- Enable telescope fzf native, if installed
			-- pcall(telescope.load_extension, 'fzf')
			-- pcall(telescope.load_extension, "file_browser")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
