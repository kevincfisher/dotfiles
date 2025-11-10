-- Neovim theme converted from Fish shell theme
-- Use with: colorscheme lava

local M = {}

-- Define colors from Fish theme
local colors = {
  bg = "#232323",
  fg = "#ffffff",
  
  -- Primary colors
  orange = "#FF9400",      -- fish_color_command, fish_color_keyword
  gold = "#BF9C30",        -- fish_color_quote
  red_orange = "#BF5B30",  -- fish_color_redirection
  bright_red = "#FF4C00",  -- fish_color_end
  yellow = "#FFDD73",      -- fish_color_error
  param = "#FFC000",       -- fish_color_param
  comment = "#A63100",     -- fish_color_comment
  cyan = "#00a6b2",        -- fish_color_operator, fish_color_escape
  green = "#00ff00",       -- fish_color_user
  dark_red = "#800000",    -- fish_color_cwd_root, fish_color_status
  
  -- UI colors
  selection = "#808080",
  light_orange = "#FFC473", -- fish_color_autosuggestion
  tan = "#B3A06D",         -- fish_pager_color_description
  olive = "#808000",       -- fish_pager_color_description bg
  teal = "#008080",        -- fish_pager_color_progress bg
  
  -- Grays
  gray = "#808080",
  dark_gray = "#404040",
}

function M.setup()
  -- Reset existing highlights
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  
  vim.o.termguicolors = true
  vim.g.colors_name = "lava"
  
  local highlights = {
    -- Editor
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.dark_gray },
    NormalNC = { fg = colors.fg, bg = colors.bg },
    
    -- Cursor
    Cursor = { fg = colors.bg, bg = colors.fg },
    CursorLine = { bg = colors.dark_gray },
    CursorLineNr = { fg = colors.orange, bold = true },
    LineNr = { fg = colors.gray },
    
    -- Selection
    Visual = { bg = colors.selection, bold = true },
    VisualNOS = { bg = colors.selection },
    
    -- Search
    Search = { fg = colors.fg, bg = colors.selection, bold = true },
    IncSearch = { fg = colors.bg, bg = colors.orange, bold = true },
    
    -- UI Elements
    StatusLine = { fg = colors.fg, bg = colors.dark_gray },
    StatusLineNC = { fg = colors.gray, bg = colors.dark_gray },
    VertSplit = { fg = colors.gray },
    Pmenu = { fg = colors.fg, bg = colors.dark_gray },
    PmenuSel = { fg = colors.fg, bg = colors.selection, bold = true },
    PmenuSbar = { bg = colors.dark_gray },
    PmenuThumb = { bg = colors.gray },
    
    -- Tabs
    TabLine = { fg = colors.gray, bg = colors.dark_gray },
    TabLineFill = { bg = colors.dark_gray },
    TabLineSel = { fg = colors.fg, bg = colors.bg, bold = true },
    
    -- Syntax
    Comment = { fg = colors.comment, italic = true },
    Constant = { fg = colors.param },
    String = { fg = colors.gold },
    Character = { fg = colors.gold },
    Number = { fg = colors.param },
    Boolean = { fg = colors.param },
    Float = { fg = colors.param },
    
    Identifier = { fg = colors.fg },
    Function = { fg = colors.orange },
    
    Statement = { fg = colors.orange, bold = true },
    Conditional = { fg = colors.orange },
    Repeat = { fg = colors.orange },
    Label = { fg = colors.orange },
    Operator = { fg = colors.cyan },
    Keyword = { fg = colors.orange },
    Exception = { fg = colors.bright_red },
    
    PreProc = { fg = colors.red_orange },
    Include = { fg = colors.red_orange },
    Define = { fg = colors.red_orange },
    Macro = { fg = colors.red_orange },
    PreCondit = { fg = colors.red_orange },
    
    Type = { fg = colors.cyan },
    StorageClass = { fg = colors.cyan },
    Structure = { fg = colors.cyan },
    Typedef = { fg = colors.cyan },
    
    Special = { fg = colors.cyan },
    SpecialChar = { fg = colors.cyan },
    Tag = { fg = colors.orange },
    Delimiter = { fg = colors.fg },
    SpecialComment = { fg = colors.tan },
    Debug = { fg = colors.bright_red },
    
    -- Underline/Error
    Underlined = { underline = true },
    Error = { fg = colors.yellow, bg = colors.dark_red, bold = true },
    ErrorMsg = { fg = colors.yellow, bold = true },
    WarningMsg = { fg = colors.orange, bold = true },
    
    -- Diff
    DiffAdd = { fg = colors.green, bg = colors.dark_gray },
    DiffChange = { fg = colors.orange, bg = colors.dark_gray },
    DiffDelete = { fg = colors.dark_red, bg = colors.dark_gray },
    DiffText = { fg = colors.cyan, bg = colors.dark_gray, bold = true },
    
    -- Spelling
    SpellBad = { undercurl = true, sp = colors.bright_red },
    SpellCap = { undercurl = true, sp = colors.orange },
    SpellLocal = { undercurl = true, sp = colors.cyan },
    SpellRare = { undercurl = true, sp = colors.gold },
    
    -- LSP
    DiagnosticError = { fg = colors.bright_red },
    DiagnosticWarn = { fg = colors.orange },
    DiagnosticInfo = { fg = colors.cyan },
    DiagnosticHint = { fg = colors.light_orange },
    
    -- Tree-sitter
    ["@variable"] = { fg = colors.fg },
    ["@variable.builtin"] = { fg = colors.param },
    ["@variable.parameter"] = { fg = colors.param },
    ["@variable.member"] = { fg = colors.fg },
    
    ["@constant"] = { fg = colors.param },
    ["@constant.builtin"] = { fg = colors.param },
    
    ["@string"] = { fg = colors.gold },
    ["@string.escape"] = { fg = colors.cyan },
    ["@string.special"] = { fg = colors.cyan },
    
    ["@function"] = { fg = colors.orange },
    ["@function.builtin"] = { fg = colors.orange },
    ["@function.method"] = { fg = colors.orange },
    
    ["@keyword"] = { fg = colors.orange },
    ["@keyword.function"] = { fg = colors.orange },
    ["@keyword.operator"] = { fg = colors.cyan },
    ["@keyword.return"] = { fg = colors.bright_red },
    
    ["@operator"] = { fg = colors.cyan },
    ["@punctuation.bracket"] = { fg = colors.fg },
    ["@punctuation.delimiter"] = { fg = colors.fg },
    
    ["@type"] = { fg = colors.cyan },
    ["@type.builtin"] = { fg = colors.cyan },
    
    ["@comment"] = { fg = colors.comment, italic = true },
  }
  
  -- Apply highlights
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

-- Auto-setup when colorscheme is set
M.setup()

return M
