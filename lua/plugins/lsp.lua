return {
	"mason-org/mason-lspconfig.nvim",
	event = { "BufEnter" },
	opts = {
		vim.lsp.enable("lua_ls"),
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
