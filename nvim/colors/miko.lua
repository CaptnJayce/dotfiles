-- miko — CaptnJayce
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.o.termguicolors = true
vim.g.colors_name = "miko"

local c = {
	bg        = "#0f0f1a",
	bg_dark   = "#0a0a12",
	bg_bar    = "#151524",
	bg_sel    = "#2d2d44",
	bg_vis    = "#3d3d5c",
	fg        = "#e8e8e8",
	fg_dim    = "#9090a8",
	fg_gutter = "#5c5c7c",
	red       = "#dc143c",
	green     = "#57c47f",
	rose      = "#e05780",
	purple    = "#9966cc",
	pink      = "#ffb7c5",
	br_red    = "#efa0a7",
	br_green  = "#7fd4a0",
	br_purple = "#b090e0",
	br_pink   = "#ffd0dd",
	br_slate  = "#b0b0c8",
}

local hi = function(group, opts) vim.api.nvim_set_hl(0, group, opts) end

-- Base
hi("Normal",            { fg = c.fg })
hi("NormalFloat",       { fg = c.fg,       bg = c.bg_dark })
hi("NormalNC",          { fg = c.fg_dim })
hi("NormalSB",          { fg = c.fg_dim,   bg = c.bg_dark })
hi("FloatBorder",       { fg = c.purple,   bg = c.bg_dark })
hi("FloatTitle",        { fg = c.pink,     bg = c.bg_dark, bold = true })

-- Cursor / line
hi("Cursor",            { fg = c.bg,       bg = c.pink })
hi("CursorIM",          { fg = c.bg,       bg = c.pink })
hi("CursorLine",        { bg = c.bg_bar })
hi("CursorLineNr",      { fg = c.pink,     bold = true })
hi("CursorColumn",      { bg = c.bg_bar })
hi("LineNr",            { fg = c.fg_gutter })
hi("SignColumn",        { fg = c.fg_gutter })

-- Selection / search
hi("Visual",            { bg = c.bg_vis })
hi("VisualNOS",         { bg = c.bg_vis })
hi("Search",            { fg = c.bg,       bg = c.pink })
hi("IncSearch",         { fg = c.bg,       bg = c.rose })
hi("CurSearch",         { fg = c.bg,       bg = c.pink })
hi("Substitute",        { fg = c.bg,       bg = c.rose })

-- Status / tab lines
hi("StatusLine",        { fg = c.fg,       bg = c.bg_bar })
hi("StatusLineNC",      { fg = c.fg_dim,   bg = c.bg_dark })
hi("TabLine",           { fg = c.fg_dim,   bg = c.bg_dark })
hi("TabLineFill",       { bg = c.bg_dark })
hi("TabLineSel",        { fg = c.bg,       bg = c.pink, bold = true })

-- Popup menu (native — cmp overrides with its own windows)
hi("Pmenu",             { fg = c.fg,       bg = c.bg_dark })
hi("PmenuSel",          { fg = c.bg,       bg = c.purple })
hi("PmenuSbar",         { bg = c.bg_sel })
hi("PmenuThumb",        { bg = c.purple })

-- UI chrome
hi("Folded",            { fg = c.fg_dim,   bg = c.bg_sel })
hi("FoldColumn",        { fg = c.fg_gutter, bg = c.bg })
hi("VertSplit",         { fg = c.bg_sel })
hi("WinSeparator",      { fg = c.bg_sel })
hi("EndOfBuffer",       { fg = c.fg_gutter })
hi("NonText",           { fg = c.fg_gutter })
hi("SpecialKey",        { fg = c.fg_gutter })
hi("Whitespace",        { fg = c.fg_gutter })
hi("MatchParen",        { fg = c.pink,     bold = true, underline = true })
hi("ColorColumn",       { bg = c.bg_bar })

-- Messages
hi("ErrorMsg",          { fg = c.red })
hi("WarningMsg",        { fg = c.rose })
hi("ModeMsg",           { fg = c.fg,       bold = true })
hi("MoreMsg",           { fg = c.green })
hi("Question",          { fg = c.purple })
hi("Title",             { fg = c.pink,     bold = true })

-- Syntax (legacy groups, still used by some parsers)
hi("Comment",           { fg = "#5c5c7c",  italic = true })
hi("Constant",          { fg = c.br_purple })
hi("String",            { fg = c.green })
hi("Character",         { fg = c.green })
hi("Number",            { fg = c.br_red })
hi("Boolean",           { fg = c.rose })
hi("Float",             { fg = c.br_red })
hi("Identifier",        { fg = c.fg })
hi("Function",          { fg = c.purple })
hi("Statement",         { fg = c.pink })
hi("Conditional",       { fg = c.pink })
hi("Repeat",            { fg = c.pink })
hi("Label",             { fg = c.rose })
hi("Operator",          { fg = c.pink })
hi("Keyword",           { fg = c.pink,     italic = true })
hi("Exception",         { fg = c.red })
hi("PreProc",           { fg = c.rose })
hi("Include",           { fg = c.purple })
hi("Define",            { fg = c.rose })
hi("Macro",             { fg = c.rose })
hi("PreCondit",         { fg = c.rose })
hi("Type",              { fg = c.br_purple })
hi("StorageClass",      { fg = c.pink })
hi("Structure",         { fg = c.br_purple })
hi("Typedef",           { fg = c.br_purple })
hi("Special",           { fg = c.pink })
hi("SpecialChar",       { fg = c.rose })
hi("Tag",               { fg = c.rose })
hi("Delimiter",         { fg = c.fg_dim })
hi("SpecialComment",    { fg = "#5c5c7c",  italic = true })
hi("Underlined",        { underline = true })
hi("Error",             { fg = c.red })
hi("Todo",              { fg = c.bg,       bg = c.rose, bold = true })

-- Diagnostics
hi("DiagnosticError",               { fg = c.red })
hi("DiagnosticWarn",                { fg = c.rose })
hi("DiagnosticInfo",                { fg = c.purple })
hi("DiagnosticHint",                { fg = c.fg_dim })
hi("DiagnosticOk",                  { fg = c.green })
hi("DiagnosticVirtualTextError",    { fg = c.red,    bg = "#1e0809", italic = true })
hi("DiagnosticVirtualTextWarn",     { fg = c.rose,   bg = "#1a0c10", italic = true })
hi("DiagnosticVirtualTextInfo",     { fg = c.purple, bg = "#120d1a", italic = true })
hi("DiagnosticVirtualTextHint",     { fg = c.fg_dim, bg = "#101018", italic = true })
hi("DiagnosticUnderlineError",      { sp = c.red,    underline = true })
hi("DiagnosticUnderlineWarn",       { sp = c.rose,   underline = true })
hi("DiagnosticUnderlineInfo",       { sp = c.purple, underline = true })
hi("DiagnosticUnderlineHint",       { sp = c.fg_dim, underline = true })
hi("DiagnosticSignError",           { fg = c.red })
hi("DiagnosticSignWarn",            { fg = c.rose })
hi("DiagnosticSignInfo",            { fg = c.purple })
hi("DiagnosticSignHint",            { fg = c.fg_dim })

-- LSP
hi("LspReferenceText",              { bg = c.bg_sel })
hi("LspReferenceRead",              { bg = c.bg_sel })
hi("LspReferenceWrite",             { bg = c.bg_vis })
hi("LspSignatureActiveParameter",   { fg = c.pink, bold = true })
hi("LspCodeLens",                   { fg = "#5c5c7c", italic = true })
hi("LspInlayHint",                  { fg = "#5c5c7c", italic = true })

-- Treesitter
hi("@variable",                { fg = c.fg })
hi("@variable.builtin",        { fg = c.br_red })
hi("@variable.parameter",      { fg = c.fg })
hi("@variable.member",         { fg = c.fg })
hi("@constant",                { fg = c.br_purple })
hi("@constant.builtin",        { fg = c.br_purple })
hi("@constant.macro",          { fg = c.rose })
hi("@module",                  { fg = c.fg })
hi("@label",                   { fg = c.rose })
hi("@string",                  { fg = c.green })
hi("@string.escape",           { fg = c.rose })
hi("@string.special",          { fg = c.rose })
hi("@string.regexp",           { fg = c.rose })
hi("@character",               { fg = c.green })
hi("@number",                  { fg = c.br_red })
hi("@number.float",            { fg = c.br_red })
hi("@boolean",                 { fg = c.rose })
hi("@type",                    { fg = c.br_purple })
hi("@type.builtin",            { fg = c.br_purple })
hi("@type.definition",         { fg = c.br_purple })
hi("@attribute",               { fg = c.rose })
hi("@property",                { fg = c.fg_dim })
hi("@function",                { fg = c.purple })
hi("@function.builtin",        { fg = c.purple })
hi("@function.call",           { fg = c.purple })
hi("@function.macro",          { fg = c.rose })
hi("@function.method",         { fg = c.purple })
hi("@function.method.call",    { fg = c.purple })
hi("@constructor",             { fg = c.br_purple })
hi("@operator",                { fg = c.pink })
hi("@keyword",                 { fg = c.pink, italic = true })
hi("@keyword.function",        { fg = c.pink, italic = true })
hi("@keyword.operator",        { fg = c.pink })
hi("@keyword.import",          { fg = c.purple })
hi("@keyword.type",            { fg = c.pink })
hi("@keyword.modifier",        { fg = c.pink })
hi("@keyword.repeat",          { fg = c.pink })
hi("@keyword.return",          { fg = c.pink })
hi("@keyword.debug",           { fg = c.red })
hi("@keyword.exception",       { fg = c.red })
hi("@keyword.conditional",     { fg = c.pink })
hi("@keyword.directive",       { fg = c.rose })
hi("@punctuation",             { fg = c.fg_dim })
hi("@punctuation.bracket",     { fg = c.fg_dim })
hi("@punctuation.delimiter",   { fg = c.fg_dim })
hi("@punctuation.special",     { fg = c.pink })
hi("@comment",                 { fg = "#5c5c7c", italic = true })
hi("@comment.documentation",   { fg = "#5c5c7c", italic = true })
hi("@markup.heading",          { fg = c.pink, bold = true })
hi("@markup.raw",              { fg = c.green })
hi("@markup.link",             { fg = c.purple, underline = true })
hi("@markup.link.url",         { fg = c.purple, underline = true })
hi("@markup.link.label",       { fg = c.pink })
hi("@markup.list",             { fg = c.rose })
hi("@markup.italic",           { italic = true })
hi("@markup.strong",           { bold = true })
hi("@markup.strikethrough",    { strikethrough = true })
hi("@tag",                     { fg = c.rose })
hi("@tag.attribute",           { fg = c.purple })
hi("@tag.delimiter",           { fg = c.fg_dim })
hi("@diff.plus",               { fg = c.green })
hi("@diff.minus",              { fg = c.red })
hi("@diff.delta",              { fg = c.rose })

-- Gitsigns
hi("GitSignsAdd",              { fg = c.green })
hi("GitSignsChange",           { fg = c.rose })
hi("GitSignsDelete",           { fg = c.red })

-- Telescope
hi("TelescopeBorder",          { fg = c.purple,  bg = c.bg_dark })
hi("TelescopeNormal",          { fg = c.fg,      bg = c.bg_dark })
hi("TelescopePromptBorder",    { fg = c.pink,    bg = c.bg_dark })
hi("TelescopePromptNormal",    { fg = c.fg,      bg = c.bg_dark })
hi("TelescopePromptPrefix",    { fg = c.pink })
hi("TelescopePromptTitle",     { fg = c.bg,      bg = c.pink,   bold = true })
hi("TelescopePreviewTitle",    { fg = c.bg,      bg = c.purple, bold = true })
hi("TelescopeResultsTitle",    { fg = c.fg_dim,  bg = c.bg_sel })
hi("TelescopeSelection",       { fg = c.fg,      bg = c.bg_sel })
hi("TelescopeSelectionCaret",  { fg = c.pink })
hi("TelescopeMatching",        { fg = c.pink,    bold = true })

-- NvimTree
hi("NvimTreeNormal",           { fg = c.fg,      bg = c.bg_dark })
hi("NvimTreeNormalNC",         { fg = c.fg_dim,  bg = c.bg_dark })
hi("NvimTreeFolderIcon",       { fg = c.purple })
hi("NvimTreeFolderName",       { fg = c.fg })
hi("NvimTreeOpenedFolderName", { fg = c.pink })
hi("NvimTreeRootFolder",       { fg = c.pink,    bold = true })
hi("NvimTreeGitDirty",         { fg = c.rose })
hi("NvimTreeGitNew",           { fg = c.green })
hi("NvimTreeGitDeleted",       { fg = c.red })
hi("NvimTreeSpecialFile",      { fg = c.pink,    bold = true })
hi("NvimTreeIndentMarker",     { fg = c.fg_gutter })
hi("NvimTreeWinSeparator",     { fg = c.bg_sel,  bg = c.bg_dark })
hi("NvimTreeEndOfBuffer",      { fg = c.bg_dark })

-- Bufferline
hi("BufferLineFill",                 { bg = c.bg_dark })
hi("BufferLineBackground",           { fg = c.fg_dim,  bg = c.bg_dark })
hi("BufferLineSelected",             { fg = c.pink,    bg = c.bg,      bold = true })
hi("BufferLineSelectedSign",         { fg = c.pink,    bg = c.bg })
hi("BufferLineSeparator",            { fg = c.bg_sel,  bg = c.bg_dark })
hi("BufferLineSeparatorSelected",    { fg = c.bg_sel,  bg = c.bg })
hi("BufferLineModified",             { fg = c.rose,    bg = c.bg_dark })
hi("BufferLineModifiedSelected",     { fg = c.rose,    bg = c.bg })
hi("BufferLineIndicatorSelected",    { fg = c.pink,    bg = c.bg })

-- Which-key
hi("WhichKey",           { fg = c.pink })
hi("WhichKeyGroup",      { fg = c.purple })
hi("WhichKeyDesc",       { fg = c.fg })
hi("WhichKeySeparator",  { fg = c.fg_gutter })
hi("WhichKeyFloat",      { bg = c.bg_dark })
hi("WhichKeyBorder",     { fg = c.purple, bg = c.bg_dark })
hi("WhichKeyValue",      { fg = c.fg_dim })

-- Trouble
hi("TroubleNormal",      { fg = c.fg,     bg = c.bg_dark })
hi("TroubleText",        { fg = c.fg })
hi("TroubleCount",       { fg = c.pink,   bg = c.bg_sel })
hi("TroubleIndent",      { fg = c.fg_gutter })

-- Indent-blankline
hi("IblIndent",          { fg = c.bg_sel })
hi("IblScope",           { fg = c.purple })

-- Noice
hi("NoiceCmdlineIcon",            { fg = c.pink })
hi("NoiceCmdlineIconSearch",      { fg = c.rose })
hi("NoiceCmdlineBorder",          { fg = c.purple, bg = c.bg_dark })
hi("NoiceCmdlinePopup",           { fg = c.fg,     bg = c.bg_dark })
hi("NoiceCmdlinePopupBorder",     { fg = c.purple, bg = c.bg_dark })
hi("NoiceCmdlinePopupTitle",      { fg = c.pink })
hi("NoiceConfirmBorder",          { fg = c.purple, bg = c.bg_dark })
hi("NoicePopupBorder",            { fg = c.purple, bg = c.bg_dark })
hi("NoiceMini",                   { fg = c.fg_dim, bg = c.bg_bar })
hi("NoiceFormatProgressDone",     { fg = c.bg,     bg = c.pink })
hi("NoiceFormatProgressTodo",     { fg = c.fg,     bg = c.bg_sel })

-- ToggleTerm
hi("ToggleTermNormal",            { bg = c.bg_dark })

-- nvim-cmp
hi("CmpNormal",                   { fg = c.fg,    bg = c.bg_dark })
hi("CmpBorder",                   { fg = c.purple, bg = c.bg_dark })
hi("CmpDocBorder",                { fg = c.purple, bg = c.bg_dark })
hi("CmpItemAbbrMatch",            { fg = c.pink,  bold = true })
hi("CmpItemAbbrMatchFuzzy",       { fg = c.pink,  bold = true })
hi("CmpItemKindFunction",         { fg = c.purple })
hi("CmpItemKindMethod",           { fg = c.purple })
hi("CmpItemKindKeyword",          { fg = c.pink })
hi("CmpItemKindProperty",         { fg = c.fg_dim })
hi("CmpItemKindInterface",        { fg = c.br_purple })
hi("CmpItemKindText",             { fg = c.fg })
hi("CmpItemKindVariable",         { fg = c.fg })
hi("CmpItemKindUnit",             { fg = c.br_red })
hi("CmpItemKindSnippet",          { fg = c.rose })

-- Leap
hi("LeapMatch",                   { fg = c.bg,  bg = c.pink,   bold = true })
hi("LeapLabelPrimary",            { fg = c.bg,  bg = c.pink,   bold = true })
hi("LeapLabelSecondary",          { fg = c.bg,  bg = c.purple })
hi("LeapLabelSelected",           { fg = c.bg,  bg = c.rose })
hi("LeapBackdrop",                { fg = c.fg_gutter })
