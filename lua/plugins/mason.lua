return {
	"mason-org/mason.nvim",
	event = { "BufEnter" },
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
