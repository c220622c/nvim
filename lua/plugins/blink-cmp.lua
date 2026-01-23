return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets" },
	-- use a release tag to download pre-built binaries
	event = "InsertEnter",
	version = "1.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = "none",
			--    ['<space-d>'] = { 'show', 'show_documentation', 'hide_documentation' },
			--    ['<C-e>'] = { 'hide', 'fallback' },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			--    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
			--    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
			--    ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
		},
		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},
		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			documentation = { -- Controls whether the documentation window will automatically show when selecting a completion item
				auto_show = true,
				-- Delay before showing the documentation window
				auto_show_delay_ms = 500,
				-- Delay before updating the documentation window when selecting a new item,
				-- while an existing item is still visible
				update_delay_ms = 50,
				-- Whether to use treesitter highlighting, disable if you run into performance issues
				treesitter_highlighting = true,
				-- Draws the item in the documentation window, by default using an internal treesitter based implementation
				draw = function(opts)
					opts.default_implementation()
				end,
				window = {
					min_width = 25,
					max_width = 80,
					max_height = 20,
					border = "rounded", -- Defaults to `vim.o.winborder` on nvim 0.11+ or 'padded' when not defined/<=0.10
					winblend = 0,
					winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
					-- Note that the gutter will be disabled when border ~= 'none'
					scrollbar = true,
					-- Which directions to show the documentation window,
					-- for each of the possible menu window directions,
					-- falling back to the next direction when there's not enough space
					direction_priority = {
						menu_north = { "e", "w", "n", "s" },
						menu_south = { "e", "w", "s", "n" },
					},
				},
			},
			list = { selection = { preselect = false, auto_insert = false } },
			keyword = { range = "full" },
			-- Disable auto brackets
			-- NOTE: some LSPs may add auto brackets themselves anyway
			accept = { auto_brackets = { enabled = false } },
			-- Display a preview of the selected item on the current line
			ghost_text = { enabled = true },
			menu = {
				enabled = true,
				min_width = 17,
				max_height = 10,
				border = "rounded", -- Defaults to `vim.o.winborder` on nvim 0.11+
				winblend = 0,
				winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
				-- Keep the cursor X lines away from the top/bottom of the window
				scrolloff = 2,
				-- Note that the gutter will be disabled when border ~= 'none'
				scrollbar = true,
				-- Which directions to show the window,
				-- falling back to the next direction when there's not enough space
				direction_priority = { "s", "n" },
				-- Can accept a function if you need more control
				-- direction_priority = function()
				--   if condition then return { 'n', 's' } end
				--   return { 's', 'n' }
				-- end,

				-- Whether to automatically show the window when new completion items are available
				auto_show = true,
				-- Delay before showing the completion menu
				auto_show_delay_ms = 0,

				-- Screen coordinates of the command line
				cmdline_position = function()
					if vim.g.ui_cmdline_pos ~= nil then
						local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
						return { pos[1] - 1, pos[2] }
					end
					local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
					return { vim.o.lines - height, 0 }
				end,
				draw = {
					-- Aligns the keyword you've typed to a component in the menu
					align_to = "label", -- or 'none' to disable, or 'cursor' to align to the cursor
					-- Left and right padding, optionally { left, right } for different padding on each side
					padding = 1,
					-- Gap between columns
					gap = 1,
					-- Priority of the cursorline highlight, setting this to 0 will render it below other highlights
					cursorline_priority = 10000,
					-- Appends an indicator to snippets label
					snippet_indicator = "~",
					-- Use treesitter to highlight the label text for the given list of sources
					treesitter = {},
					-- treesitter = { 'lsp' }

					-- Components to render, grouped by column
					columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },

					-- Definitions for possible components to render. Each defines:
					--   ellipsis: whether to add an ellipsis when truncating the text
					--   width: control the min, max and fill behavior of the component
					--   text function: will be called for each item
					--   highlight function: will be called only when the line appears on screen
					components = {
						kind_icon = {
							ellipsis = false,
							text = function(ctx)
								return ctx.kind_icon .. ctx.icon_gap
							end,
							-- Set the highlight priority to 20000 to beat the cursorline's default priority of 10000
							highlight = function(ctx)
								return { { group = ctx.kind_hl, priority = 20000 } }
							end,
						},

						kind = {
							ellipsis = false,
							width = { fill = true },
							text = function(ctx)
								return ctx.kind
							end,
							highlight = function(ctx)
								return ctx.kind_hl
							end,
						},

						label = {
							width = { fill = true, max = 60 },
							text = function(ctx)
								return ctx.label .. ctx.label_detail
							end,
							highlight = function(ctx)
								-- label and label details
								local highlights = {
									{
										0,
										#ctx.label,
										group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
									},
								}
								if ctx.label_detail then
									table.insert(
										highlights,
										{ #ctx.label, #ctx.label + #ctx.label_detail, group = "BlinkCmpLabelDetail" }
									)
								end

								-- characters matched on the label by the fuzzy matcher
								for _, idx in ipairs(ctx.label_matched_indices) do
									table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
								end

								return highlights
							end,
						},

						label_description = {
							width = { max = 30 },
							text = function(ctx)
								return ctx.label_description
							end,
							highlight = "BlinkCmpLabelDescription",
						},

						source_name = {
							width = { max = 30 },
							text = function(ctx)
								return ctx.source_name
							end,
							highlight = "BlinkCmpSource",
						},

						source_id = {
							width = { max = 30 },
							text = function(ctx)
								return ctx.source_id
							end,
							highlight = "BlinkCmpSource",
						},
					},
				},
			},
		},
		-- Controls how the completion items are rendered on the popup window
		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
