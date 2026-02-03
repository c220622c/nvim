return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[                                                                           ]],
			[[ooooo      ooo                     oooooo     oooo  o8o                    ]],
			[[`888b.     `8'                      `888.     .8'   `"'                    ]],
			[[ 8 `88b.    8   .ooooo.   .ooooo.    `888.   .8'   oooo  ooo. .oo.  .oo.   ]],
			[[ 8   `88b.  8  d88' `88b d88' `88b    `888. .8'    `888  `888P"Y88bP"Y88b  ]],
			[[ 8     `88b.8  888ooo888 888   888     `888.8'      888   888   888   888  ]],
			[[ 8       `888  888    .o 888   888      `888'       888   888   888   888  ]],
			[[o8o        `8  `Y8bod8P' `Y8bod8P'       `8'       o888o o888o o888o o888o ]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("f", "  Open File", ":Telescope find_files<CR>"),
			dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
			dashboard.button("m", "  Lsps", ":Mason<CR>"),
			dashboard.button("l", "  Plugins", ":Lazy<CR>"),
			dashboard.button("t", "  Themes", ":Telescope colorscheme<CR>"),
		}
		local function footer()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			return "󰀡 Welcome to  Neovim"
				.. "  󰀨 v"
				.. vim.version().major
				.. "."
				.. vim.version().minor
				.. "."
				.. vim.version().patch
				.. "  󰂖 "
				.. stats.count
				.. " plugins "
		end

		dashboard.section.footer.val = footer()

		dashboard.config.opts.noautocmd = true
		local head_butt_padding = 2
		local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
		local header_padding = math.max(0, math.ceil((vim.fn.winheight(0) - occu_height) * 0.25))
		local foot_butt_padding = 1

		dashboard.config.layout = {
			{ type = "padding", val = header_padding },
			dashboard.section.header,
			{ type = "padding", val = head_butt_padding },
			dashboard.section.buttons,
			{ type = "padding", val = foot_butt_padding },
			dashboard.section.footer,
		}
		vim.cmd([[autocmd User AlphaReady echo 'ready']])

		alpha.setup(dashboard.config)
	end,
}
