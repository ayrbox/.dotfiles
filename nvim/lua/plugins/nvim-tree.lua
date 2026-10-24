return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			disable_netrw = true,
			hijack_netrw = true,
			respect_buf_cwd = true,
			sync_root_with_cwd = true,
			view = {
				relativenumber = true,
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()

						return {
							border = "rounded",
							relative = "editor",
							row = 0,
							col = 0,
							width = screen_w,
							height = screen_h,
						}
					end,
				},
			},
		})
		vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", {})
	end,
}
