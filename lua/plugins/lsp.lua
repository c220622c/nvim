return {
	"mason-org/mason-lspconfig.nvim",
	event = { "BufRead", "BufNewFile" },
	opts = {
		vim.lsp.enable("lua_ls"),
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
