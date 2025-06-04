return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = false,
			popup_border_style = "NC", -- or "" to use 'winborder' on Neovim v0.11+
			enable_git_status = true,
			enable_diagnostics = true,
		})
		vim.keymap.set("n", "<C-b>", ":Neotree filesystem toggle left <CR>", {})
		vim.keymap.set("n", "<leader>#", ":Neotree filesystem toggle left <CR>", {})
	end,
}
