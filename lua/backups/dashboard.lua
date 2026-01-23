return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			-- config
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{ desc = "󰊳 Manage Plugins", group = "@property", action = "Lazy", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Telescope Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " Apps",
						group = "DiagnosticHint",
						action = "Telescope app",
						key = "a",
					},
					{
						desc = " dotfiles",
						group = "Number",
						action = "Telescope dotfiles",
						key = "d",
					},
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
