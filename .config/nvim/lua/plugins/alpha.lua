vim.pack.add({
	"https://github.com/goolord/alpha-nvim",
	"https://github.com/nvim-lua/plenary.nvim",
})
local alpha = require("alpha")
local time_utils = require("utils.time")
local strings = require("plenary.strings")
local user_name = "Kevin"

local dashboard_ns = vim.api.nvim_create_namespace("MyDashboard")
print(dashboard_ns)
vim.api.nvim_set_hl(dashboard_ns, "GreetingMorning", { fg = "orange" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead"}, {
  pattern = "*",
  callback = function()
    vim.fn.matchadd("GreetingMorning", "")
  end
})
-- Functions
local function get_greeting()
	local current_hour = time_utils.get_hour()

	local greetings = {
		[1] = " Good Morning",
		[2] = " Good Afternoon",
		[3] = "󰖚 Good Evening",
		[4] = " Go to Bed",
	}

	local greeting = ""
	if current_hour >= 6 and current_hour < 12 then
		greeting = greetings[1]
	elseif current_hour >= 12 and current_hour < 17 then
		greeting = greetings[2]
	elseif current_hour >= 17 and current_hour < 23 then
		greeting = greetings[3]
	else
		greeting = greetings[4]
	end
	return greeting .. ", " .. user_name
end

local leader = "␣"

--- @param shortcut string
--- @param txt string
--- @param keybind string? optional
--- @param kb_opts table? optional
local function button(shortcut, txt, keybind, kb_opts)
	local sc_ = shortcut:gsub("%s", ""):gsub(leader, "<leader>")

	local opts = {
		position = "center",
		shortcut = shortcut,
		cursor = 2,
		width = 32,
		align_shortcut = "right",
    hl  = "@attribute.keyword",
		hl_shortcut = "Keyword",
	}
	if keybind then
		kb_opts = vim.F.if_nil(kb_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, kb_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

local cmd_container_top = "╭─────────────┤Commands├──────────╮"
local container_width = strings.strdisplaywidth(cmd_container_top)
local cmd_container_bottom = "╰" .. string.rep("─", container_width - 2) .. "╯"
local menu_group = {
	type = "group",
	val = {
		{ type = "text", val = cmd_container_top, opts = { position = "center" } },
		button("f", "󰱼 Find File", "<cmd>FzfLua files<CR>"),
		button("n", " New File", "<cmd>ene<cr>"),
		button("u", " Update Plugins", ""),
		button("␣c", " Config", ""),
		button("q", "⏻ Exit Neovim", "<cmd>qall!<cr>"),
		{ type = "text", val = cmd_container_bottom, opts = { position = "center" } },
	},
	opts = {
		position = "v_center",
	},
}

local header = {
	type = "text",
	val = {
		[[ ,ggg,        gg                                             ,gggg,                                              ]],
		[[dP""Y8b       dP  ,dPYb,                  ,dPYb,           ,88"""Y8b,                      8I                    ]],
		[[Yb, `88      d8'  IP'`Yb                  IP'`Yb          d8"     `Y8                      8I                    ]],
		[[ `"  88    ,dP'   I8  8I   gg             I8  8I         d8'   8b  d8                      8I                    ]],
		[[     88aaad8"     I8  8'   ""             I8  8'        ,8I    "Y88P'                      8I                    ]],
		[[     88""""Yb,    I8 dP    gg     ,g,     I8 dPgg,      I8'             ,ggggg,      ,gggg,8I   ,ggg,     ,g,    ]],
		[[     88     "8b   I8dP     88    ,8'8,    I8dP" "8I     d8             dP"  "Y8ggg  dP"  "Y8I  i8" "8i   ,8'8,   ]],
		[[     88      `8i  I8P      88   ,8'  Yb   I8P    I8     Y8,           i8'    ,8I   i8'    ,8I  I8, ,8I  ,8'  Yb  ]],
		[[     88       Yb,,d8b,_  _,88,_,8'_   8) ,d8     I8,    `Yba,,_____, ,d8,   ,d8'  ,d8,   ,d8b, `YbadP' ,8'_   8) ]],
		[[     88        Y8PI8"88888P""Y8P' "YY8P8P88P     `Y8      `"Y8888888 P"Y8888P"    P"Y8888P"`Y8888P"Y888P' "YY8P8P]],
		[[                  I8 `8,                                                                                         ]],
		[[                  I8  `8,                                                                                        ]],
		[[                  I8   8I                                                                                        ]],
		[[                  I8   8I                                                                                        ]],
		[[                  I8, ,8'                                                                                        ]],
		[[                   "Y8P'                                                                                         ]],
	},
	opts = {
		position = "center",
    hl="@attribute"
	},
}

local sub_header = {
	type = "text",
	val = get_greeting(),
  opts = {
    position = "center"
  }
}

local divider = {
	type = "padding",
	val = 2,
}

local function meta_info()
  local all_plugins = vim.pack.get()
  local loaded = 0
  for _, plugin in ipairs(all_plugins) do
    if plugin.active then loaded = loaded + 1 end
  end
	local version = vim.version()
	return string.format(" • 󱐋 %d/%d plugins loaded •  v%d.%d.%d", loaded, #all_plugins, version.major, version.minor, version.patch)
end

local layout = {
	divider,
	header,
	divider,
	sub_header,
	divider,
	menu_group,
  divider,
	{
		type = "group",
		val = {
      { type = "text", val = "something here", opts = { position = "center" } },
      { type = "text", val = meta_info(), opts = { position = "center", hl = "@comment" } }
    },
		opts = {
			position = "v_center",
		},
	},
}
local config = {
	layout = layout,
}
alpha.setup(config)
