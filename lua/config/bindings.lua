local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Better escape using jk in insert mode
keymap("i", "jk", "<ESC>", default_opts)

-- Better indent
keymap("v", "K", "<gv", default_opts)
keymap("v", "J", ">gv", default_opts)

-- Switch buffer
keymap("n", "<A-j>", ":bprevious<CR>", default_opts)
keymap("n", "<A-k>", ":bnext<CR>", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)
-- Resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<Up>", ":resize -1<CR>", default_opts)
keymap("n", "<Down>", ":resize +1<CR>", default_opts)

--which-key register mappings
local wk = require("which-key")
wk.add({
	--Telescopes
	--	{ "<leader>t", desc = "Telescope" },
	--	{ "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
	--	{ "<leader>tc", "<cmd>Telescope commands<cr>", desc = "Find commands", mode = "n" },
	--	{ "<leader>tb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find pattern in buffer", mode = "n" },
	--	{ "<leader>tp", "<cmd>Telescope live_grep<cr>", desc = "Find pattern in pwd", mode = "n" },
	-- Lsps
	{ "<leader>l", icon = "󰇻", desc = "Lsps" },
	{ "<leader>lm", "<cmd>Mason<cr>", desc = "Open Mason UI", mode = "n" },
	{ "<leader>ls", "<cmd>LspStart<cr>", desc = "Start Lsp", mode = "n" },
	{ "<leader>ll", "<cmd>LspLog<cr>", desc = "Show Lsp Log in new buffer", mode = "n" },
	--NvimTree
	--	{ "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree", mode = "n" },
	--trouble
	{ "<leader>x", desc = "Trouble", icon = "", mode = "n" },
	{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)", mode = "n" },
	{
		"<leader>xX",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		desc = "Buffer Diagnostics (Trouble)",
		mode = "n",
	},
	{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)", mode = "n" },
	{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)", mode = "n" },
})
