return {
	"mason-org/mason.nvim",
	event = { "BufRead", "BufNewFile" },
	cmd = "Mason",
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
}
