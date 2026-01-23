return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			themes = "gruvbox",
			section_separators = { left = "", right = "" },
			component_separators = { left = ">>>", right = "<<<" },
		},
	},
}
