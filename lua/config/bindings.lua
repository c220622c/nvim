local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Better escape using jk in insert mode
keymap("i", "jk", "<ESC>", default_opts)

-- Better indent
keymap("v", "K", "<gv", default_opts)
keymap("v", "J", ">gv", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)
-- Resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<Up>", ":resize -1<CR>", default_opts)
keymap("n", "<Down>", ":resize +1<CR>", default_opts)

--Use BufferLineGoToBuffer to Switch Buffer
keymap("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", default_opts)
keymap("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", default_opts)
keymap("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", default_opts)
keymap("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", default_opts)
keymap("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", default_opts)
keymap("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", default_opts)
keymap("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", default_opts)
--create and Switch windows
keymap("n", "<A-cr>", ":vs<CR>", default_opts)
keymap("n", "<C-cr>", ":split<CR>", default_opts)
keymap("n", "<A-h>", "<C-w>h", default_opts)
keymap("n", "<A-j>", "<C-w>j", default_opts)
keymap("n", "<A-k>", "<C-w>k", default_opts)
keymap("n", "<A-l>", "<C-w>l", default_opts)
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
	--snacks.picker
	--TODO: add snack bindings
	{ "<leader>t", icon = "", desc = "Toogle Settings", mode = "n" },
	{ "<leader>s", icon = "", desc = "Snacks picker", mode = "n" },
	--Switch buffer
	{ "<leader>b", icon = "", desc = "Buffer commands", mode = "n" },
	{ "<leader>bh", ":BufferLineCyclePrev<CR>", icon = "", desc = "Left Buffer", silent = true },
	{ "<leader>bl", ":BufferLineCycleNext<CR>", icon = "", desc = "Right Buffer", silent = true },
	{ "<leader>bd", ":bdelete<CR>", icon = "", desc = "Delete Buffer", silent = true },
	{ "<leader>bo", ":BufferLineCloseOthers<CR>", icon = "", desc = "Close Other Buffer", silent = true },
	{ "<leader>bp", ":BufferLinePick<CR>", icon = "", desc = "Pick Buffer ", silent = true },
	{ "<leader>bc", ":BufferLinePickClose<CR>", icon = "🏹", desc = "Pick Buffer to Close", silent = true },

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
