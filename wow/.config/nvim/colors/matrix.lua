-- matrix.lua — a truecolor Neovim colorscheme.
--
-- Derived from the cmux "Matrix" terminal theme
-- (https://cmuxthemes.com/themes/matrix/). The terminal exposes only 16 ANSI
-- slots, which render flat in nvim; this scheme keeps those exact hues but adds
-- a handful of derived background/UI shades so syntax, diagnostics and floats
-- have real contrast. Requires termguicolors (set in init.lua).

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.g.colors_name = "matrix"

-- Palette: the 16 Matrix ANSI colors, plus derived bg/ui shades (bg1..bg3, sel)
-- sampled along the #0f191c base for layering.
local p = {
	bg = "#0f191c", -- Normal background (ANSI 0)
	bg_dim = "#0a1113", -- darker than Normal (inactive areas)
	bg1 = "#16242a", -- cursorline, pmenu, floats
	bg2 = "#1f3138", -- statusline mid, visual base
	bg3 = "#2a3f38", -- selection, borders, pmenu thumb
	sel = "#24403a", -- visual selection
	diff_add = "#13291b", -- diff add bg tint
	diff_chg = "#1b2a22", -- diff change bg tint
	diff_del = "#241618", -- diff delete bg tint

	fg = "#82d967", -- main foreground (ANSI 2, readable green)
	fg_dim = "#678c61", -- dimmer text (ANSI 15)
	comment = "#688060", -- comments / non-text (ANSI 8)
	gutter = "#3f5242", -- line numbers, fold col (ANSI 4)

	green = "#82d967", -- ANSI 2
	green_b = "#90d762", -- ANSI 10 (functions, bright)
	matrix = "#11ff25", -- ANSI 13 (keywords — the iconic matrix green)
	lime = "#c1ff8a", -- ANSI 14 (strings, selection text)
	teal = "#50b45a", -- ANSI 6 (types)
	teal_d = "#4f7e7e", -- ANSI 12 (borders, info)
	moss = "#507350", -- ANSI 7 (punctuation/delimiters)
	gold = "#ffd700", -- ANSI 3 (numbers, constants)
	yellow = "#faff00", -- ANSI 11 (search, warnings, matches)
	emerald = "#2fc079", -- ANSI 9 (preproc, builtins)
	forest = "#409931", -- ANSI 5 (search bg)
	red = "#ff0000", -- cursor red, reused for errors/deletes
	none = "NONE",
}

local hl = function(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local groups = {
	-- Editor UI ---------------------------------------------------------------
	Normal = { fg = p.fg, bg = p.bg },
	NormalNC = { fg = p.fg, bg = p.bg },
	NormalFloat = { fg = p.fg_dim, bg = p.bg1 },
	FloatBorder = { fg = p.teal_d, bg = p.bg1 },
	FloatTitle = { fg = p.matrix, bg = p.bg1, bold = true },
	ColorColumn = { bg = p.bg1 },
	Cursor = { fg = p.bg, bg = p.green_b },
	lCursor = { fg = p.bg, bg = p.green_b },
	CursorIM = { fg = p.bg, bg = p.green_b },
	TermCursor = { fg = p.bg, bg = p.matrix },
	CursorLine = { bg = p.bg1 },
	CursorColumn = { bg = p.bg1 },
	CursorLineNr = { fg = p.green_b, bold = true },
	LineNr = { fg = p.gutter },
	LineNrAbove = { fg = p.gutter },
	LineNrBelow = { fg = p.gutter },
	SignColumn = { fg = p.gutter, bg = p.none },
	FoldColumn = { fg = p.gutter, bg = p.none },
	Folded = { fg = p.comment, bg = p.bg1 },
	WinSeparator = { fg = p.bg3 },
	VertSplit = { fg = p.bg3 },
	Visual = { bg = p.sel },
	VisualNOS = { bg = p.sel },
	Search = { fg = p.bg, bg = p.forest },
	IncSearch = { fg = p.bg, bg = p.yellow },
	CurSearch = { fg = p.bg, bg = p.yellow },
	Substitute = { fg = p.bg, bg = p.gold },
	MatchParen = { fg = p.matrix, bold = true, underline = true },
	NonText = { fg = p.bg3 },
	Whitespace = { fg = p.bg2 },
	SpecialKey = { fg = p.bg3 },
	EndOfBuffer = { fg = p.bg },
	Conceal = { fg = p.comment },
	Directory = { fg = p.teal },
	Title = { fg = p.matrix, bold = true },
	ErrorMsg = { fg = p.red, bold = true },
	WarningMsg = { fg = p.yellow },
	ModeMsg = { fg = p.green },
	MoreMsg = { fg = p.green },
	Question = { fg = p.green },
	MsgArea = { fg = p.fg },
	MsgSeparator = { fg = p.bg3 },
	WildMenu = { fg = p.bg, bg = p.green },
	QuickFixLine = { bg = p.bg2, bold = true },
	Pmenu = { fg = p.fg_dim, bg = p.bg1 },
	PmenuSel = { fg = p.lime, bg = p.bg3, bold = true },
	PmenuKind = { fg = p.teal, bg = p.bg1 },
	PmenuKindSel = { fg = p.teal, bg = p.bg3 },
	PmenuExtra = { fg = p.comment, bg = p.bg1 },
	PmenuExtraSel = { fg = p.comment, bg = p.bg3 },
	PmenuSbar = { bg = p.bg2 },
	PmenuThumb = { bg = p.teal_d },
	StatusLine = { fg = p.green, bg = p.bg2 },
	StatusLineNC = { fg = p.comment, bg = p.bg1 },
	TabLine = { fg = p.comment, bg = p.bg1 },
	TabLineFill = { bg = p.bg },
	TabLineSel = { fg = p.matrix, bg = p.bg2, bold = true },
	WinBar = { fg = p.fg, bg = p.none },
	WinBarNC = { fg = p.comment, bg = p.none },

	-- Syntax (legacy groups) --------------------------------------------------
	Comment = { fg = p.comment, italic = true },
	Constant = { fg = p.gold },
	String = { fg = p.lime },
	Character = { fg = p.lime },
	Number = { fg = p.gold },
	Boolean = { fg = p.gold },
	Float = { fg = p.gold },
	Identifier = { fg = p.fg },
	Function = { fg = p.green_b },
	Statement = { fg = p.matrix },
	Conditional = { fg = p.matrix },
	Repeat = { fg = p.matrix },
	Label = { fg = p.matrix },
	Operator = { fg = p.teal },
	Keyword = { fg = p.matrix },
	Exception = { fg = p.matrix },
	PreProc = { fg = p.emerald },
	Include = { fg = p.emerald },
	Define = { fg = p.emerald },
	Macro = { fg = p.emerald },
	PreCondit = { fg = p.emerald },
	Type = { fg = p.teal },
	StorageClass = { fg = p.teal },
	Structure = { fg = p.teal },
	Typedef = { fg = p.teal },
	Special = { fg = p.green_b },
	SpecialChar = { fg = p.gold },
	Tag = { fg = p.matrix },
	Delimiter = { fg = p.moss },
	SpecialComment = { fg = p.comment, bold = true },
	Debug = { fg = p.red },
	Underlined = { fg = p.teal, underline = true },
	Ignore = { fg = p.bg3 },
	Error = { fg = p.red, bold = true },
	Todo = { fg = p.bg, bg = p.yellow, bold = true },

	-- Diagnostics -------------------------------------------------------------
	DiagnosticError = { fg = p.red },
	DiagnosticWarn = { fg = p.yellow },
	DiagnosticInfo = { fg = p.teal_d },
	DiagnosticHint = { fg = p.teal },
	DiagnosticOk = { fg = p.green },
	DiagnosticUnderlineError = { undercurl = true, sp = p.red },
	DiagnosticUnderlineWarn = { undercurl = true, sp = p.yellow },
	DiagnosticUnderlineInfo = { undercurl = true, sp = p.teal_d },
	DiagnosticUnderlineHint = { undercurl = true, sp = p.teal },
	DiagnosticVirtualTextError = { fg = p.red, bg = p.bg1 },
	DiagnosticVirtualTextWarn = { fg = p.yellow, bg = p.bg1 },
	DiagnosticVirtualTextInfo = { fg = p.teal_d, bg = p.bg1 },
	DiagnosticVirtualTextHint = { fg = p.teal, bg = p.bg1 },
	DiagnosticUnnecessary = { fg = p.comment, italic = true },
	DiagnosticDeprecated = { fg = p.comment, strikethrough = true },

	-- LSP ---------------------------------------------------------------------
	LspReferenceText = { bg = p.bg2 },
	LspReferenceRead = { bg = p.bg2 },
	LspReferenceWrite = { bg = p.bg2, underline = true },
	LspSignatureActiveParameter = { fg = p.matrix, bold = true },
	LspInlayHint = { fg = p.gutter, bg = p.bg1, italic = true },
	LspCodeLens = { fg = p.comment, italic = true },

	-- Treesitter --------------------------------------------------------------
	["@comment"] = { link = "Comment" },
	["@comment.documentation"] = { fg = p.comment },
	["@comment.error"] = { fg = p.red },
	["@comment.warning"] = { fg = p.yellow },
	["@comment.todo"] = { link = "Todo" },
	["@comment.note"] = { fg = p.teal },
	["@error"] = { fg = p.red },
	["@keyword"] = { fg = p.matrix },
	["@keyword.function"] = { fg = p.matrix },
	["@keyword.return"] = { fg = p.matrix },
	["@keyword.operator"] = { fg = p.matrix },
	["@keyword.import"] = { fg = p.emerald },
	["@keyword.exception"] = { fg = p.matrix },
	["@keyword.conditional"] = { fg = p.matrix },
	["@keyword.repeat"] = { fg = p.matrix },
	["@conditional"] = { fg = p.matrix },
	["@repeat"] = { fg = p.matrix },
	["@function"] = { fg = p.green_b },
	["@function.call"] = { fg = p.green_b },
	["@function.builtin"] = { fg = p.teal },
	["@function.macro"] = { fg = p.emerald },
	["@method"] = { fg = p.green_b },
	["@method.call"] = { fg = p.green_b },
	["@constructor"] = { fg = p.teal },
	["@parameter"] = { fg = p.fg },
	["@variable"] = { fg = p.fg },
	["@variable.builtin"] = { fg = p.emerald, italic = true },
	["@variable.parameter"] = { fg = p.fg },
	["@variable.member"] = { fg = p.lime },
	["@field"] = { fg = p.lime },
	["@property"] = { fg = p.lime },
	["@constant"] = { fg = p.gold },
	["@constant.builtin"] = { fg = p.gold },
	["@constant.macro"] = { fg = p.emerald },
	["@string"] = { fg = p.lime },
	["@string.escape"] = { fg = p.gold },
	["@string.regex"] = { fg = p.teal },
	["@string.special"] = { fg = p.gold },
	["@character"] = { fg = p.lime },
	["@character.special"] = { fg = p.gold },
	["@number"] = { fg = p.gold },
	["@number.float"] = { fg = p.gold },
	["@float"] = { fg = p.gold },
	["@boolean"] = { fg = p.gold },
	["@type"] = { fg = p.teal },
	["@type.builtin"] = { fg = p.teal_d },
	["@type.definition"] = { fg = p.teal },
	["@attribute"] = { fg = p.emerald },
	["@operator"] = { fg = p.teal },
	["@punctuation.delimiter"] = { fg = p.moss },
	["@punctuation.bracket"] = { fg = p.moss },
	["@punctuation.special"] = { fg = p.matrix },
	["@tag"] = { fg = p.matrix },
	["@tag.attribute"] = { fg = p.green_b },
	["@tag.delimiter"] = { fg = p.moss },
	["@namespace"] = { fg = p.teal },
	["@module"] = { fg = p.teal },
	["@label"] = { fg = p.matrix },
	["@text"] = { fg = p.fg },
	["@text.literal"] = { fg = p.lime },
	["@text.reference"] = { fg = p.teal },
	["@text.title"] = { fg = p.matrix, bold = true },
	["@text.uri"] = { fg = p.teal, underline = true },
	["@text.emphasis"] = { italic = true },
	["@text.strong"] = { bold = true },

	-- Treesitter markup (markdown etc.) ---------------------------------------
	["@markup.heading"] = { fg = p.matrix, bold = true },
	["@markup.heading.1"] = { fg = p.matrix, bold = true },
	["@markup.heading.2"] = { fg = p.green_b, bold = true },
	["@markup.heading.3"] = { fg = p.green, bold = true },
	["@markup.link"] = { fg = p.teal, underline = true },
	["@markup.link.label"] = { fg = p.lime },
	["@markup.link.url"] = { fg = p.teal_d, underline = true },
	["@markup.raw"] = { fg = p.lime },
	["@markup.raw.block"] = { fg = p.lime },
	["@markup.list"] = { fg = p.green_b },
	["@markup.strong"] = { bold = true },
	["@markup.italic"] = { italic = true },
	["@markup.strikethrough"] = { strikethrough = true },
	["@markup.quote"] = { fg = p.comment, italic = true },

	-- Diff / git --------------------------------------------------------------
	DiffAdd = { bg = p.diff_add },
	DiffChange = { bg = p.diff_chg },
	DiffDelete = { fg = p.red, bg = p.diff_del },
	DiffText = { bg = p.bg3 },
	diffAdded = { fg = p.green },
	diffRemoved = { fg = p.red },
	diffChanged = { fg = p.gold },
	diffFile = { fg = p.teal },
	diffLine = { fg = p.comment },
	GitSignsAdd = { fg = p.green },
	GitSignsChange = { fg = p.gold },
	GitSignsDelete = { fg = p.red },
	GitSignsAddNr = { fg = p.green },
	GitSignsChangeNr = { fg = p.gold },
	GitSignsDeleteNr = { fg = p.red },
	GitSignsCurrentLineBlame = { fg = p.comment, italic = true },

	-- Telescope ---------------------------------------------------------------
	TelescopeNormal = { fg = p.fg_dim, bg = p.bg1 },
	TelescopeBorder = { fg = p.teal_d, bg = p.bg1 },
	TelescopePromptNormal = { fg = p.fg, bg = p.bg2 },
	TelescopePromptBorder = { fg = p.teal_d, bg = p.bg2 },
	TelescopePromptTitle = { fg = p.bg, bg = p.matrix, bold = true },
	TelescopePromptPrefix = { fg = p.matrix },
	TelescopePromptCounter = { fg = p.comment },
	TelescopePreviewTitle = { fg = p.bg, bg = p.green, bold = true },
	TelescopePreviewBorder = { fg = p.teal_d, bg = p.bg1 },
	TelescopeResultsTitle = { fg = p.bg, bg = p.teal, bold = true },
	TelescopeSelection = { fg = p.lime, bg = p.bg3 },
	TelescopeSelectionCaret = { fg = p.matrix, bg = p.bg3 },
	TelescopeMatching = { fg = p.yellow, bold = true },

	-- blink.cmp ---------------------------------------------------------------
	BlinkCmpMenu = { fg = p.fg_dim, bg = p.bg1 },
	BlinkCmpMenuBorder = { fg = p.teal_d, bg = p.bg1 },
	BlinkCmpMenuSelection = { bg = p.bg3, bold = true },
	BlinkCmpLabel = { fg = p.fg_dim },
	BlinkCmpLabelMatch = { fg = p.yellow, bold = true },
	BlinkCmpLabelDeprecated = { fg = p.comment, strikethrough = true },
	BlinkCmpLabelDetail = { fg = p.comment },
	BlinkCmpLabelDescription = { fg = p.comment },
	BlinkCmpKind = { fg = p.teal },
	BlinkCmpDoc = { fg = p.fg_dim, bg = p.bg1 },
	BlinkCmpDocBorder = { fg = p.teal_d, bg = p.bg1 },
	BlinkCmpDocSeparator = { fg = p.bg3, bg = p.bg1 },
	BlinkCmpGhostText = { fg = p.comment, italic = true },
	BlinkCmpSignatureHelp = { fg = p.fg_dim, bg = p.bg1 },
	BlinkCmpSignatureHelpBorder = { fg = p.teal_d, bg = p.bg1 },

	-- which-key ---------------------------------------------------------------
	WhichKey = { fg = p.green_b },
	WhichKeyGroup = { fg = p.teal },
	WhichKeyDesc = { fg = p.fg },
	WhichKeySeparator = { fg = p.comment },
	WhichKeyFloat = { bg = p.bg1 },
	WhichKeyBorder = { fg = p.teal_d, bg = p.bg1 },
	WhichKeyValue = { fg = p.comment },

	-- mini.statusline ---------------------------------------------------------
	MiniStatuslineModeNormal = { fg = p.bg, bg = p.green, bold = true },
	MiniStatuslineModeInsert = { fg = p.bg, bg = p.lime, bold = true },
	MiniStatuslineModeVisual = { fg = p.bg, bg = p.matrix, bold = true },
	MiniStatuslineModeReplace = { fg = p.bg, bg = p.gold, bold = true },
	MiniStatuslineModeCommand = { fg = p.bg, bg = p.teal, bold = true },
	MiniStatuslineModeOther = { fg = p.bg, bg = p.teal_d, bold = true },
	MiniStatuslineDevinfo = { fg = p.fg_dim, bg = p.bg2 },
	MiniStatuslineFilename = { fg = p.fg_dim, bg = p.bg1 },
	MiniStatuslineFileinfo = { fg = p.fg_dim, bg = p.bg2 },
	MiniStatuslineInactive = { fg = p.comment, bg = p.bg1 },

	-- noice -------------------------------------------------------------------
	NoiceCmdlinePopup = { fg = p.fg, bg = p.bg1 },
	NoiceCmdlinePopupBorder = { fg = p.teal_d, bg = p.bg1 },
	NoiceCmdlineIcon = { fg = p.matrix },
	NoiceConfirmBorder = { fg = p.teal_d, bg = p.bg1 },

	-- neogit ------------------------------------------------------------------
	NeogitBranch = { fg = p.matrix, bold = true },
	NeogitRemote = { fg = p.teal },
	NeogitHunkHeader = { fg = p.fg, bg = p.bg2 },
	NeogitHunkHeaderHighlight = { fg = p.matrix, bg = p.bg2 },
	NeogitDiffAdd = { fg = p.green, bg = p.diff_add },
	NeogitDiffAddHighlight = { fg = p.green, bg = p.diff_add },
	NeogitDiffDelete = { fg = p.red, bg = p.diff_del },
	NeogitDiffDeleteHighlight = { fg = p.red, bg = p.diff_del },
	NeogitDiffContextHighlight = { bg = p.bg1 },

	-- misc plugin links -------------------------------------------------------
	GitBlameVirtualText = { fg = p.comment, italic = true },
	OilDir = { fg = p.teal },
	OilFile = { fg = p.fg },
	HarpoonBorder = { fg = p.teal_d, bg = p.bg1 },
	HarpoonWindow = { fg = p.fg, bg = p.bg1 },
}

for group, opts in pairs(groups) do
	hl(group, opts)
end

-- Terminal job colors mirror the Matrix ANSI palette.
vim.g.terminal_color_0 = "#0f191c"
vim.g.terminal_color_1 = "#23755a"
vim.g.terminal_color_2 = "#82d967"
vim.g.terminal_color_3 = "#ffd700"
vim.g.terminal_color_4 = "#3f5242"
vim.g.terminal_color_5 = "#409931"
vim.g.terminal_color_6 = "#50b45a"
vim.g.terminal_color_7 = "#507350"
vim.g.terminal_color_8 = "#688060"
vim.g.terminal_color_9 = "#2fc079"
vim.g.terminal_color_10 = "#90d762"
vim.g.terminal_color_11 = "#faff00"
vim.g.terminal_color_12 = "#4f7e7e"
vim.g.terminal_color_13 = "#11ff25"
vim.g.terminal_color_14 = "#c1ff8a"
vim.g.terminal_color_15 = "#678c61"
