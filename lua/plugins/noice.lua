-- noice

local M = {}
M[1] = {}
local noice = M[1]


noice[1] = "folke/noice.nvim"
noice.event = "VeryLazy"


noice.opts = {
	-- add any options here
}


noice.dependencies = {
	-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	"MunifTanjim/nui.nvim",
	-- OPTIONAL:
	--	 `nvim-notify` is only needed, if you want to use the notification view.
	--	 If not available, we use `mini` as the fallback
	"rcarriga/nvim-notify",
}


noice.config = function ()
    require("noice").setup({
    	cmdline = {
        	enabled = true, -- enables the Noice cmdline UI
        	view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        	opts = {}, -- global options for the cmdline. See section on views
        	---@type table<string, CmdlineFormat>
        	format = {
        		-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
        		-- view: (default is cmdline view)
        		-- opts: any options passed to the view
        		-- icon_hl_group: optional hl_group for the icon
        		-- title: set to anything or empty string to hide
        		cmdline = { pattern = "^:", icon = "$", lang = "vim" },
        		search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        		search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        		filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        		lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
        		help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
        		input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
        		-- lua = false, -- to disable a format, set to `false`
        	},
        },
        messages = {
        	-- NOTE: If you enable messages, then the cmdline is enabled automatically.
        	-- This is a current Neovim limitation.
        	enabled = true, -- enables the Noice messages UI
        	view = "notify", -- default view for messages
        	view_error = "notify", -- view for errors
        	view_warn = "notify", -- view for warnings
        	view_history = "messages", -- view for :messages
        	view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
        },
        popupmenu = {
        	enabled = true, -- enables the Noice popupmenu UI
        	---@type 'nui'|'cmp'
        	backend = "nui", -- backend to use to show regular cmdline completions
        	---@type NoicePopupmenuItemKind|false
        	-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
        	kind_icons = {}, -- set to `false` to disable icons
        },
        -- default options for require('noice').redirect
        -- see the section on Command Redirection
        ---@type NoiceRouteConfig
        redirect = {
        	view = "popup",
        	filter = { event = "msg_show" },
        },
        -- You can add any custom commands below that will be available with `:Noice command`
        ---@type table<string, NoiceCommand>
        commands = {
        	history = {
        		-- options for the message history that you get with `:Noice`
        		view = "split",
        		opts = { enter = true, format = "details" },
        		filter = {
        			any = {
        				{ event = "notify" },
        				{ error = true },
        				{ warning = true },
        				{ event = "msg_show", kind = { "" } },
        				{ event = "lsp", kind = "message" },
        			},
        		},
        	},
        	-- :Noice last
        	last = {
        		view = "popup",
        		opts = { enter = true, format = "details" },
        		filter = {
        			any = {
        				{ event = "notify" },
        				{ error = true },
        				{ warning = true },
        				{ event = "msg_show", kind = { "" } },
        				{ event = "lsp", kind = "message" },
        			},
        		},
        		filter_opts = { count = 1 },
        	},
        	-- :Noice errors
        	errors = {
        		-- options for the message history that you get with `:Noice`
        		view = "popup",
        		opts = { enter = true, format = "details" },
        		filter = { error = true },
        		filter_opts = { reverse = true },
        	},
        	all = {
        		-- options for the message history that you get with `:Noice`
        		view = "split",
        		opts = { enter = true, format = "details" },
        		filter = {},
        	},
        },
        notify = {
        	-- Noice can be used as `vim.notify` so you can route any notification like other messages
        	-- Notification messages have their level and other properties set.
        	-- event is always "notify" and kind can be any log level as a string
        	-- The default routes will forward notifications to nvim-notify
        	-- Benefit of using Noice for this is the routing and consistent history view
        	enabled = true,
        	view = "notify",
        },
        lsp = {
        	progress = {
        		enabled = true,
        		-- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
        		-- See the section on formatting for more details on how to customize.
        		--- @type NoiceFormat|string
        		format = "lsp_progress",
        		--- @type NoiceFormat|string
        		format_done = "lsp_progress_done",
        		throttle = 1000 / 30, -- frequency to update lsp progress message
        		view = "mini",
        	},
        	override = {
        		-- override the default lsp markdown formatter with Noice
        		["vim.lsp.util.convert_input_to_markdown_lines"] = false,
        		-- override the lsp markdown formatter with Noice
        		["vim.lsp.util.stylize_markdown"] = false,
        		-- override cmp documentation with Noice (needs the other options to work)
        		["cmp.entry.get_documentation"] = false,
        	},
        	hover = {
        		enabled = true,
        		silent = false, -- set to true to not show a message if hover is not available
        		view = nil, -- when nil, use defaults from documentation
        		---@type NoiceViewOptions
        		opts = {}, -- merged with defaults from documentation
        	},
        	signature = {
        		enabled = true,
        		auto_open = {
        			enabled = true,
        			trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
        			luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
        			throttle = 50, -- Debounce lsp signature help request by 50ms
        		},
        		view = nil, -- when nil, use defaults from documentation
        		---@type NoiceViewOptions
        		opts = {}, -- merged with defaults from documentation
        	},
        	message = {
        		-- Messages shown by lsp servers
        		enabled = true,
        		view = "notify",
        		opts = {},
        	},
        	-- defaults for hover and signature help
        	documentation = {
        		view = "hover",
        		---@type NoiceViewOptions
        		opts = {
        			lang = "markdown",
        			replace = true,
        			render = "plain",
        			format = { "{message}" },
        			win_options = { concealcursor = "n", conceallevel = 3 },
        		},
        	},
        },
        markdown = {
        	hover = {
        		["|(%S-)|"] = vim.cmd.help, -- vim help links
        		["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
        	},
        	highlights = {
        		["|%S-|"] = "@text.reference",
        		["@%S+"] = "@parameter",
        		["^%s*(Parameters:)"] = "@text.title",
        		["^%s*(Return:)"] = "@text.title",
        		["^%s*(See also:)"] = "@text.title",
        		["{%S-}"] = "@parameter",
        	},
        },
        health = {
        	checker = true, -- Disable if you don't want health checks to run
        },
        ---@type NoicePresets
        presets = {
        	-- you can enable a preset by setting it to true, or a table that will override the preset config
        	-- you can also add custom presets that you can enable/disable with enabled=true
        	bottom_search = false, -- use a classic bottom cmdline for search
        	command_palette = false, -- position the cmdline and popupmenu together
        	long_message_to_split = false, -- long messages will be sent to a split
        	inc_rename = false, -- enables an input dialog for inc-rename.nvim
        	lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
        ---@type NoiceConfigViews
        views = {
            cmdline_popup = {
                position = {
                  row = 5,
                  col = "50%",
                },
                size = {
                  width = 60,
                  height = "auto",
                },
            },
            popupmenu = {
                relative = "editor",
                position = {
                  row = 8,
                  col = "50%",
                },
                size = {
                  width = 60,
                  height = 10,
                },
                border = {
                  style = "rounded",
                  padding = { 0, 1 },
                },
                win_options = {
                  winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                },
            },
        }, ---@see section on views
        ---@type NoiceRouteConfig[]
        routes = {}, --- @see section on routes
        ---@type table<string, NoiceFilter>
        status = {}, --- @see section on statusline components
        ---@type NoiceFormatOptions
        format = {}, --- @see section on formatting
    })

    local cmdline_border_fg = "#FFFFFF"  -- 白色（命令行外框）
    local search_border_fg  = "#8b9096"  -- 灰色（搜索/其它 popup 外框）
    local keep_transparent   = true      -- 是否保持浮窗背景透明

    local function set_noice_hls()
    	vim.api.nvim_set_hl(0, "NoiceCmdlinePopup",    { bg = keep_transparent and "NONE" or nil, fg = search_border_fg })
    	vim.api.nvim_set_hl(0, "NoiceCmdlineIcon",     { bg = keep_transparent and "NONE" or nil, fg = search_border_fg })
    	vim.api.nvim_set_hl(0, "NoiceCmdlinePrompt",   { bg = keep_transparent and "NONE" or nil, fg = search_border_fg, bold = true })
    	-- confirmations / errors / hints
    	vim.api.nvim_set_hl(0, "NoiceConfirm",         { bg = keep_transparent and "NONE" or nil, fg = search_border_fg })
    	vim.api.nvim_set_hl(0, "NoiceError",           { bg = keep_transparent and "NONE" or nil, fg = search_border_fg })
    	vim.api.nvim_set_hl(0, "NoiceWarn",            { bg = keep_transparent and "NONE" or nil, fg = search_border_fg })

        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", {
            fg = cmdline_border_fg,
            bg = keep_transparent and "NONE" or nil,
        })

        -- 一般的 popup 边框（搜索、hover、帮助等通用 popup）
        vim.api.nvim_set_hl(0, "NoicePopupBorder", {
            fg = search_border_fg,
            bg = keep_transparent and "NONE" or nil,
        })

        -- popupmenu（补全菜单）外框
        vim.api.nvim_set_hl(0, "NoicePopupmenuBorder", {
            fg = search_border_fg,
            bg = keep_transparent and "NONE" or nil,
        })

        -- split view border（有时 noice 在 split 里显示内容）
        vim.api.nvim_set_hl(0, "NoiceSplitBorder", {
            fg = search_border_fg,
            bg = keep_transparent and "NONE" or nil,
        })
    end

    -- 1) 立即设置（当前会话）
    set_noice_hls()

    -- 2) 在每次 colorscheme 改变后重新应用（防止被覆盖）
    vim.api.nvim_create_autocmd("ColorScheme", {
    	callback = function() set_noice_hls() end,
    })
end


return M

