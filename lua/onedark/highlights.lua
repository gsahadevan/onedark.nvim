local c    = require('onedark.colors')
local util = require('onedark.util')
local cfg  = vim.g.onedark_config

local M    = {}
local hl   = { langs = {}, plugins = {} }

local function vim_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s guisp=%s gui=%s", group_name,
            group_settings.fg or "none",
            group_settings.bg or "none",
            group_settings.sp or "none",
            group_settings.fmt or "none"))
    end
end

hl.common = {
    ColorColumn      = { bg = c.bg1 },
    Conceal          = { fg = c.grey, bg = c.bg1 },
    CurSearch        = { fg = c.bg0, bg = c.orange },
    Cursor           = { fmt = "reverse" },
    CursorColumn     = { bg = c.bg1 },
    CursorIM         = { fmt = "reverse" },
    CursorLine       = { bg = c.bg1 },
    CursorLineNr     = { fg = c.fg },
    Debug            = { fg = c.yellow },
    DiffAdd          = { fg = c.none, bg = c.diff_add },
    DiffAdded        = { fg = c.green },
    DiffChange       = { fg = c.none, bg = c.diff_change },
    DiffDelete       = { fg = c.none, bg = c.diff_delete },
    DiffFile         = { fg = c.cyan },
    DiffIndexLine    = { fg = c.grey },
    DiffRemoved      = { fg = c.red },
    DiffText         = { fg = c.none, bg = c.diff_text },
    Directory        = { fg = c.blue },
    EndOfBuffer      = { fg = cfg.ending_tildes and c.bg2 or c.bg0, bg = cfg.transparent and c.none or c.bg0 },
    ErrorMsg         = { fg = c.red, fmt = "bold" },
    FloatBorder      = { fg = c.grey },
    FoldColumn       = { fg = c.fg },
    Folded           = { fg = c.fg, bg = cfg.transparent and c.none or c.bg1 },
    IncSearch        = { fg = c.bg0, bg = c.orange },
    LineNr           = { fg = c.grey },
    MatchParen       = { fg = c.none, bg = c.grey },
    MoreMsg          = { fg = c.blue, fmt = "bold" },
    NonText          = { fg = c.grey },
    Normal           = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
    NormalFloat      = { fg = c.fg, bg = c.bg1 },
    Pmenu            = { fg = c.fg, bg = c.bg1 },
    PmenuSbar        = { fg = c.none, bg = c.bg1 },
    PmenuSel         = { fg = c.bg0, bg = c.bg_blue },
    PmenuThumb       = { fg = c.none, bg = c.grey },
    Question         = { fg = c.yellow },
    QuickFixLine     = { fg = c.blue, fmt = "underline" },
    Search           = { fg = c.bg0, bg = c.bg_yellow },
    SignColumn       = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
    SpecialKey       = { fg = c.grey },
    SpellBad         = { fg = c.red, fmt = "underline", sp = c.red },
    SpellCap         = { fg = c.yellow, fmt = "underline", sp = c.yellow },
    SpellLocal       = { fg = c.blue, fmt = "underline", sp = c.blue },
    SpellRare        = { fg = c.purple, fmt = "underline", sp = c.purple },
    StatusLine       = { fg = c.fg, bg = c.bg2 },
    StatusLineNC     = { fg = c.grey, bg = c.bg1 },
    StatusLineTerm   = { fg = c.fg, bg = c.bg2 },
    StatusLineTermNC = { fg = c.grey, bg = c.bg1 },
    Substitute       = { fg = c.bg0, bg = c.green },
    TabLine          = { fg = c.fg, bg = c.bg1 },
    TabLineFill      = { fg = c.grey, bg = c.bg1 },
    TabLineSel       = { fg = c.bg0, bg = c.fg },
    Terminal         = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
    ToolbarButton    = { fg = c.bg0, bg = c.bg_blue },
    ToolbarLine      = { fg = c.fg },
    VertSplit        = { fg = c.bg3 },
    Visual           = { bg = c.bg3 },
    VisualNOS        = { fg = c.none, bg = c.bg2, fmt = "underline" },
    WarningMsg       = { fg = c.yellow, fmt = "bold" },
    Whitespace       = { fg = c.grey },
    WildMenu         = { fg = c.bg0, bg = c.blue },
    debugBreakpoint  = { fg = c.bg0, bg = c.red },
    debugPC          = { fg = c.bg0, bg = c.green },
    iCursor          = { fmt = "reverse" },
    lCursor          = { fmt = "reverse" },
    vCursor          = { fmt = "reverse" },
}

hl.syntax = {
    Boolean        = { fg = c.orange },
    Character      = { fg = c.orange },
    Comment        = { fg = c.grey, fmt = cfg.code_style.comments },
    Conditional    = { fg = c.purple, fmt = cfg.code_style.keywords },
    Constant       = { fg = c.cyan },
    Define         = { fg = c.purple },
    Delimiter      = { fg = c.light_grey },
    Error          = { fg = c.purple },
    Exception      = { fg = c.purple },
    Float          = { fg = c.orange },
    Function       = { fg = c.blue, fmt = cfg.code_style.functions },
    Identifier     = { fg = c.red, fmt = cfg.code_style.variables },
    Include        = { fg = c.purple },
    Keyword        = { fg = c.purple, fmt = cfg.code_style.keywords },
    Label          = { fg = c.purple },
    Macro          = { fg = c.red },
    Number         = { fg = c.orange },
    Operator       = { fg = c.purple },
    PreCondit      = { fg = c.purple },
    PreProc        = { fg = c.purple },
    Repeat         = { fg = c.purple, fmt = cfg.code_style.keywords },
    Special        = { fg = c.red },
    SpecialChar    = { fg = c.red },
    SpecialComment = { fg = c.grey, fmt = cfg.code_style.comments },
    Statement      = { fg = c.purple },
    StorageClass   = { fg = c.yellow },
    String         = { fg = c.green, fmt = cfg.code_style.strings },
    Structure      = { fg = c.yellow },
    Tag            = { fg = c.green },
    Title          = { fg = c.cyan },
    Todo           = { fg = c.red, fmt = cfg.code_style.comments },
    Type           = { fg = c.yellow },
    Typedef        = { fg = c.purple },
}

hl.treesitter = {
    ["@annotation"]            = { fg = c.fg },
    ["@attribute"]             = { fg = c.cyan },
    ["@boolean"]               = { fg = c.orange },
    ["@character"]             = { fg = c.orange },
    ["@comment"]               = { fg = c.grey, fmt = cfg.code_style.comments },
    ["@conditional"]           = { fg = c.purple, fmt = cfg.code_style.keywords },
    ["@constant"]              = { fg = c.orange },
    ["@constant.builtin"]      = { fg = c.orange },
    ["@constant.macro"]        = { fg = c.orange },
    ["@constructor"]           = { fg = c.yellow, fmt = "bold" },
    ["@danger"]                = { fg = c.fg },
    ["@error"]                 = { fg = c.fg },
    ["@exception"]             = { fg = c.purple },
    ["@field"]                 = { fg = c.cyan },
    ["@float"]                 = { fg = c.orange },
    ["@function"]              = { fg = c.blue, fmt = cfg.code_style.functions },
    ["@function.builtin"]      = { fg = c.cyan, fmt = cfg.code_style.functions },
    ["@function.macro"]        = { fg = c.cyan, fmt = cfg.code_style.functions },
    ["@include"]               = { fg = c.purple },
    ["@keyword"]               = { fg = c.purple, fmt = cfg.code_style.keywords },
    ["@keyword.function"]      = { fg = c.purple, fmt = cfg.code_style.functions },
    ["@keyword.operator"]      = { fg = c.purple, fmt = cfg.code_style.keywords },
    ["@label"]                 = { fg = c.red },
    ["@method"]                = { fg = c.blue },
    ["@namespace"]             = { fg = c.yellow },
    ["@none"]                  = { fg = c.fg },
    ["@note"]                  = { fg = c.fg },
    ["@number"]                = { fg = c.orange },
    ["@operator"]              = { fg = c.blue },
    ["@parameter"]             = { fg = c.red },
    ["@parameter.reference"]   = { fg = c.fg },
    ["@property"]              = { fg = c.cyan },
    ["@punctuation.bracket"]   = { fg = c.light_grey },
    ["@punctuation.delimiter"] = { fg = c.light_grey },
    ["@punctuation.special"]   = { fg = c.red },
    ["@repeat"]                = { fg = c.purple, fmt = cfg.code_style.keywords },
    ["@string"]                = { fg = c.green, fmt = cfg.code_style.strings },
    ["@string.escape"]         = { fg = c.red, fmt = cfg.code_style.strings },
    ["@string.regex"]          = { fg = c.orange, fmt = cfg.code_style.strings },
    ["@symbol"]                = { fg = c.cyan },
    ["@tag"]                   = { fg = c.purple },
    ["@tag.attribute"]         = { fg = c.yellow },
    ["@tag.delimiter"]         = { fg = c.purple },
    ["@text"]                  = { fg = c.fg },
    ["@text.diff.add"]         = { fg = c.green },
    ["@text.diff.delete"]      = { fg = c.red },
    ["@text.emphasis"]         = { fg = c.fg, fmt = 'italic' },
    ["@text.environment"]      = { fg = c.fg },
    ["@text.environment.name"] = { fg = c.fg },
    ["@text.literal"]          = { fg = c.green },
    ["@text.math"]             = { fg = c.fg },
    ["@text.reference"]        = { fg = c.blue },
    ["@text.strike"]           = { fg = c.fg, fmt = 'strikethrough' },
    ["@text.strong"]           = { fg = c.fg, fmt = 'bold' },
    ["@text.title"]            = { fg = c.orange, fmt = 'bold' },
    ["@text.todo"]             = { fg = c.red, fmt = cfg.code_style.comments },
    ["@text.underline"]        = { fg = c.fg, fmt = 'underline' },
    ["@text.uri"]              = { fg = c.cyan, fmt = 'underline' },
    ["@type"]                  = { fg = c.yellow },
    ["@type.builtin"]          = { fg = c.orange },
    ["@variable"]              = { fg = c.yellow, fmt = cfg.code_style.variables },
    ["@variable.builtin"]      = { fg = c.red, fmt = cfg.code_style.variables },
    ["@warning"]               = { fg = c.orange },
}

local diagnostics_error_color = cfg.diagnostics.darker and c.dark_red or c.red
local diagnostics_hint_color = cfg.diagnostics.darker and c.dark_purple or c.purple
local diagnostics_warn_color = cfg.diagnostics.darker and c.dark_yellow or c.yellow
local diagnostics_info_color = cfg.diagnostics.darker and c.dark_cyan or c.cyan
hl.plugins.lsp = {
    DiagnosticError               = { fg = c.red },
    DiagnosticHint                = { fg = c.purple },
    DiagnosticInfo                = { fg = c.cyan },
    DiagnosticUnderlineError      = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.red },
    DiagnosticUnderlineHint       = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.purple },
    DiagnosticUnderlineInfo       = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.blue },
    DiagnosticUnderlineWarn       = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.yellow },
    DiagnosticWarn                = { fg = c.yellow },
    LspCodeLens                   = { fg = c.grey, fmt = cfg.code_style.comments },
    LspCodeLensSeparator          = { fg = c.grey },
    LspCxxHlGroupEnumConstant     = { fg = c.orange },
    LspCxxHlGroupMemberVariable   = { fg = c.orange },
    LspCxxHlGroupNamespace        = { fg = c.blue },
    LspCxxHlSkippedRegion         = { fg = c.grey },
    LspCxxHlSkippedRegionBeginEnd = { fg = c.red },
    LspReferenceRead              = { bg = c.bg2 },
    LspReferenceText              = { bg = c.bg2 },
    LspReferenceWrite             = { bg = c.bg2 },
    DiagnosticVirtualTextError    = {
        bg = cfg.diagnostics.background and util.darken(diagnostics_error_color, 0.1, c.bg0) or c.none,
        fg = diagnostics_error_color
    },
    DiagnosticVirtualTextWarn     = {
        bg = cfg.diagnostics.background and util.darken(diagnostics_warn_color, 0.1, c.bg0) or c.none,
        fg = diagnostics_warn_color
    },
    DiagnosticVirtualTextInfo     = {
        bg = cfg.diagnostics.background and util.darken(diagnostics_info_color, 0.1, c.bg0) or c.none,
        fg = diagnostics_info_color
    },
    DiagnosticVirtualTextHint     = {
        bg = cfg.diagnostics.background and util.darken(diagnostics_hint_color, 0.1, c.bg0) or c.none,
        fg = diagnostics_hint_color
    },
}

hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
hl.plugins.lsp.LspDiagnosticsUnderlineError = hl.plugins.lsp.DiagnosticUnderlineError
hl.plugins.lsp.LspDiagnosticsUnderlineHint = hl.plugins.lsp.DiagnosticUnderlineHint
hl.plugins.lsp.LspDiagnosticsUnderlineInformation = hl.plugins.lsp.DiagnosticUnderlineInfo
hl.plugins.lsp.LspDiagnosticsUnderlineWarning = hl.plugins.lsp.DiagnosticUnderlineWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextError = hl.plugins.lsp.DiagnosticVirtualTextError
hl.plugins.lsp.LspDiagnosticsVirtualTextWarning = hl.plugins.lsp.DiagnosticVirtualTextWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextInformation = hl.plugins.lsp.DiagnosticVirtualTextInfo
hl.plugins.lsp.LspDiagnosticsVirtualTextHint = hl.plugins.lsp.DiagnosticVirtualTextHint

hl.plugins.ale = {
    ALEErrorSign   = hl.plugins.lsp.DiagnosticError,
    ALEInfoSign    = hl.plugins.lsp.DiagnosticInfo,
    ALEWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.barbar = {
    BufferCurrent       = { fmt = "bold" },
    BufferCurrentMod    = { fg = c.orange, fmt = "bold,italic" },
    BufferCurrentSign   = { fg = c.purple },
    BufferInactiveMod   = { fg = c.light_grey, bg = c.bg1, fmt = "italic" },
    BufferVisible       = { fg = c.light_grey, bg = c.bg0 },
    BufferVisibleMod    = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
    BufferVisibleIndex  = { fg = c.light_grey, bg = c.bg0 },
    BufferVisibleSign   = { fg = c.light_grey, bg = c.bg0 },
    BufferVisibleTarget = { fg = c.light_grey, bg = c.bg0 },
}

hl.plugins.cmp = {
    CmpItemAbbr           = { fg = c.fg },
    CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
    CmpItemAbbrMatch      = { fg = c.cyan },
    CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
    CmpItemMenu           = { fg = c.light_grey },
    CmpItemKind           = { fg = c.purple, fmt = cfg.cmp_itemkind_reverse and "reverse" },
}

hl.plugins.coc = {
    CocErrorSign   = hl.plugins.lsp.DiagnosticError,
    CocHintSign    = hl.plugins.lsp.DiagnosticHint,
    CocInfoSign    = hl.plugins.lsp.DiagnosticInfo,
    CocWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.whichkey = {
    WhichKey          = { fg = c.red },
    WhichKeyDesc      = { fg = c.blue },
    WhichKeyGroup     = { fg = c.orange },
    WhichKeySeperator = { fg = c.green }
}

hl.plugins.gitgutter = {
    GitGutterAdd    = { fg = c.green },
    GitGutterChange = { fg = c.blue },
    GitGutterDelete = { fg = c.red },
}

hl.plugins.hop = {
    HopNextKey   = { fg = c.red, fmt = "bold" },
    HopNextKey1  = { fg = c.cyan, fmt = "bold" },
    HopNextKey2  = { fg = util.darken(c.blue, 0.7) },
    HopUnmatched = { fg = c.grey },
}

-- comment
hl.plugins.diffview = {
    DiffviewFilePanelTitle      = { fg = c.blue, fmt = "bold" },
    DiffviewFilePanelCounter    = { fg = c.purple, fmt = "bold" },
    DiffviewFilePanelFileName   = { fg = c.fg },
    DiffviewNormal              = hl.common.Normal,
    DiffviewCursorLine          = hl.common.CursorLine,
    DiffviewVertSplit           = hl.common.VertSplit,
    DiffviewSignColumn          = hl.common.SignColumn,
    DiffviewStatusLine          = hl.common.StatusLine,
    DiffviewStatusLineNC        = hl.common.StatusLineNC,
    DiffviewEndOfBuffer         = hl.common.EndOfBuffer,
    DiffviewFilePanelRootPath   = { fg = c.grey },
    DiffviewFilePanelPath       = { fg = c.grey },
    DiffviewFilePanelInsertions = { fg = c.green },
    DiffviewFilePanelDeletions  = { fg = c.red },
    DiffviewStatusAdded         = { fg = c.green },
    DiffviewStatusUntracked     = { fg = c.blue },
    DiffviewStatusModified      = { fg = c.blue },
    DiffviewStatusRenamed       = { fg = c.blue },
    DiffviewStatusCopied        = { fg = c.blue },
    DiffviewStatusTypeChange    = { fg = c.blue },
    DiffviewStatusUnmerged      = { fg = c.blue },
    DiffviewStatusUnknown       = { fg = c.red },
    DiffviewStatusDeleted       = { fg = c.red },
    DiffviewStatusBroken        = { fg = c.red }
}

hl.plugins.gitsigns = {
    GitSignsAdd      = { fg = c.green },
    GitSignsAddLn    = { fg = c.green },
    GitSignsAddNr    = { fg = c.green },
    GitSignsChange   = { fg = c.blue },
    GitSignsChangeLn = { fg = c.blue },
    GitSignsChangeNr = { fg = c.blue },
    GitSignsDelete   = { fg = c.red },
    GitSignsDeleteLn = { fg = c.red },
    GitSignsDeleteNr = { fg = c.red }
}

hl.plugins.neo_tree = {
    NeoTreeEndOfBuffer        = { fg = cfg.ending_tildes and c.bg2 or c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
    NeoTreeGitAdded           = { fg = c.green },
    NeoTreeGitConflict        = { fg = c.red, fmt = "bold,italic" },
    NeoTreeGitDeleted         = { fg = c.red },
    NeoTreeGitModified        = { fg = c.yellow },
    NeoTreeGitUntracked       = { fg = c.red, fmt = "italic" },
    NeoTreeIndentMarker       = { fg = c.grey },
    NeoTreeNormal             = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
    NeoTreeNormalNC           = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
    NeoTreeRootName           = { fg = c.orange, fmt = "bold" },
    NeoTreeSymbolicLinkTarget = { fg = c.purple },
    NeoTreeVertSplit          = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
    NeoTreeWinSeparator       = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
}

hl.plugins.neotest = {
    NeotestAdapterName  = { fg = c.purple, fmt = "bold" },
    NeotestDir          = { fg = c.cyan },
    NeotestExpandMarker = { fg = c.grey },
    NeotestFailed       = { fg = c.red },
    NeotestFile         = { fg = c.cyan },
    NeotestFocused      = { fmt = "bold,italic" },
    NeotestIndent       = { fg = c.grey },
    NeotestMarked       = { fg = c.orange, fmt = "bold" },
    NeotestNamespace    = { fg = c.blue },
    NeotestPassed       = { fg = c.green },
    NeotestRunning      = { fg = c.yellow },
    NeotestSkipped      = { fg = c.light_grey },
    NeotestTarget       = { fg = c.purple },
    NeotestTest         = { fg = c.fg },
    NeotestUnknown      = { fg = c.light_grey },
    NeotestWinSelect    = { fg = c.cyan, fmt = "bold" },
}

hl.plugins.nvim_tree = {
    NvimTreeEndOfBuffer  = { fg = cfg.ending_tildes and c.bg2 or c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeFolderName   = { fg = c.blue },
    NvimTreeGitDeleted   = { fg = c.red },
    NvimTreeGitDirty     = { fg = c.yellow },
    NvimTreeGitNew       = { fg = c.green },
    NvimTreeImageFile    = { fg = c.dark_purple },
    NvimTreeIndentMarker = { fg = c.fg },
    NvimTreeNormal       = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeRootFolder   = { fg = c.orange, fmt = "bold" },
    NvimTreeSpecialFile  = { fg = c.yellow, fmt = "underline" },
    NvimTreeSymlink      = { fg = c.purple },
    NvimTreeVertSplit    = { fg = c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
}

hl.plugins.telescope = {
    TelescopeBorder         = { fg = c.red },
    TelescopeMatching       = { fg = c.orange, fmt = "bold" },
    TelescopePreviewBorder  = { fg = c.cyan },
    TelescopePromptBorder   = { fg = c.cyan },
    TelescopePromptPrefix   = { fg = c.green },
    TelescopeResultsBorder  = { fg = c.cyan },
    TelescopeSelection      = { bg = c.bg2 },
    TelescopeSelectionCaret = { fg = c.yellow }
}

hl.plugins.dashboard = {
    DashboardCenter   = { fg = c.cyan },
    DashboardFooter   = { fg = c.dark_red, fmt = "italic" },
    DashboardHeader   = { fg = c.yellow },
    DashboardShortCut = { fg = c.blue },
}

hl.plugins.outline = {
    AerialLine    = { fg = c.purple, bg = c.bg2, fmt = "bold" },
    FocusedSymbol = { fg = c.purple, bg = c.bg2, fmt = "bold" },
}

hl.plugins.navic = {
    NavicSeparator = { fg = c.light_grey },
    NavicText      = { fg = c.fg },
}

hl.plugins.ts_rainbow = {
    rainbowcol1 = { fg = c.grey },
    rainbowcol2 = { fg = c.yellow },
    rainbowcol3 = { fg = c.blue },
    rainbowcol4 = { fg = c.orange },
    rainbowcol5 = { fg = c.purple },
    rainbowcol6 = { fg = c.green },
    rainbowcol7 = { fg = c.red }
}

hl.plugins.indent_blankline = {
    IndentBlanklineChar             = { fg = c.bg1, gui = "nocombine" },
    IndentBlanklineContext          = { fg = c.orange, bg = c.grey, bold = true },
    IndentBlanklineContextChar      = { fg = c.grey, gui = "nocombine" },
    IndentBlanklineContextSpaceChar = { gui = "nocombine" },
    IndentBlanklineContextStart     = { sp = c.grey, gui = "underline" },
    IndentBlanklineIndent1          = { fg = c.blue },
    IndentBlanklineIndent2          = { fg = c.green },
    IndentBlanklineIndent3          = { fg = c.cyan },
    IndentBlanklineIndent4          = { fg = c.light_grey },
    IndentBlanklineIndent5          = { fg = c.purple },
    IndentBlanklineIndent6          = { fg = c.red },
}

hl.plugins.mini = {
    MiniCompletionActiveParameter = { fmt = "underline" },
    MiniCursorword                = { fmt = "underline" },
    MiniCursorwordCurrent         = { fmt = "underline" },
    MiniIndentscopePrefix         = { fmt = "nocombine" }, -- Make it invisible
    MiniIndentscopeSymbol         = { fg = c.grey },
    MiniJump                      = { fg = c.purple, fmt = "underline", sp = c.purple },
    MiniJump2dSpot                = { fg = c.red, fmt = "bold,nocombine" },
    MiniStarterCurrent            = { fmt = "nocombine" },
    MiniStarterFooter             = { fg = c.dark_red, fmt = "italic" },
    MiniStarterHeader             = { fg = c.yellow },
    MiniStarterInactive           = { fg = c.grey, fmt = cfg.code_style.comments },
    MiniStarterItem               = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
    MiniStarterItemBullet         = { fg = c.grey },
    MiniStarterItemPrefix         = { fg = c.yellow },
    MiniStarterQuery              = { fg = c.cyan },
    MiniStarterSection            = { fg = c.light_grey },
    MiniStatuslineDevinfo         = { fg = c.fg, bg = c.bg2 },
    MiniStatuslineFileinfo        = { fg = c.fg, bg = c.bg2 },
    MiniStatuslineFilename        = { fg = c.grey, bg = c.bg1 },
    MiniStatuslineInactive        = { fg = c.grey, bg = c.bg0 },
    MiniStatuslineModeCommand     = { fg = c.bg0, bg = c.yellow, fmt = "bold" },
    MiniStatuslineModeInsert      = { fg = c.bg0, bg = c.blue, fmt = "bold" },
    MiniStatuslineModeNormal      = { fg = c.bg0, bg = c.green, fmt = "bold" },
    MiniStatuslineModeOther       = { fg = c.bg0, bg = c.cyan, fmt = "bold" },
    MiniStatuslineModeReplace     = { fg = c.bg0, bg = c.red, fmt = "bold" },
    MiniStatuslineModeVisual      = { fg = c.bg0, bg = c.purple, fmt = "bold" },
    MiniSurround                  = { fg = c.bg0, bg = c.orange },
    MiniTablineCurrent            = { fmt = "bold" },
    MiniTablineFill               = { fg = c.grey, bg = c.bg1 },
    MiniTablineHidden             = { fg = c.fg, bg = c.bg1 },
    MiniTablineModifiedCurrent    = { fg = c.orange, fmt = "bold,italic" },
    MiniTablineModifiedHidden     = { fg = c.light_grey, bg = c.bg1, fmt = "italic" },
    MiniTablineModifiedVisible    = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
    MiniTablineTabpagesection     = { fg = c.bg0, bg = c.bg_yellow },
    MiniTablineVisible            = { fg = c.light_grey, bg = c.bg0 },
    MiniTestEmphasis              = { fmt = "bold" },
    MiniTestFail                  = { fg = c.red, fmt = "bold" },
    MiniTestPass                  = { fg = c.green, fmt = "bold" },
    MiniTrailspace                = { bg = c.red },
}

hl.langs.c = {
    cDefine       = { fg = c.cyan },
    cInclude      = { fg = c.blue },
    cStorageClass = { fg = c.purple },
    cTSConstMacro = { fg = c.purple },
    cTSConstant   = { fg = c.cyan },
    cTSInclude    = { fg = c.blue },
    cTSOperator   = { fg = c.purple },
    cTypedef      = { fg = c.purple },
}

hl.langs.cpp = {
    cppStatement    = { fg = c.purple, fmt = "bold" },
    cppTSConstMacro = { fg = c.purple },
    cppTSConstant   = { fg = c.cyan },
    cppTSInclude    = { fg = c.blue },
    cppTSOperator   = { fg = c.purple },
}

hl.langs.markdown = {
    markdownBlockquote        = { fg = c.grey },
    markdownBold              = { fg = c.none, fmt = "bold" },
    markdownBoldDelimiter     = { fg = c.grey },
    markdownCode              = { fg = c.green },
    markdownCodeBlock         = { fg = c.green },
    markdownCodeDelimiter     = { fg = c.yellow },
    markdownH1                = { fg = c.red, fmt = "bold" },
    markdownH2                = { fg = c.purple, fmt = "bold" },
    markdownH3                = { fg = c.orange, fmt = "bold" },
    markdownH4                = { fg = c.red, fmt = "bold" },
    markdownH5                = { fg = c.purple, fmt = "bold" },
    markdownH6                = { fg = c.orange, fmt = "bold" },
    markdownHeadingDelimiter  = { fg = c.grey },
    markdownHeadingRule       = { fg = c.grey },
    markdownId                = { fg = c.yellow },
    markdownIdDeclaration     = { fg = c.red },
    markdownItalic            = { fg = c.none, fmt = "italic" },
    markdownItalicDelimiter   = { fg = c.grey, fmt = "italic" },
    markdownLinkDelimiter     = { fg = c.grey },
    markdownLinkText          = { fg = c.red },
    markdownLinkTextDelimiter = { fg = c.grey },
    markdownListMarker        = { fg = c.red },
    markdownOrderedListMarker = { fg = c.red },
    markdownRule              = { fg = c.purple },
    markdownUrl               = { fg = c.blue, fmt = "underline" },
    markdownUrlDelimiter      = { fg = c.grey },
    markdownUrlTitleDelimiter = { fg = c.green }
}

hl.langs.php = {
    phpBoolean        = { fg = c.cyan },
    phpFCKeyword      = { fg = c.purple, fmt = cfg.code_style.keywords },
    phpFunctions      = { fg = c.fg, fmt = cfg.code_style.functions },
    phpHereDoc        = { fg = c.green },
    phpIdentifier     = { fg = c.orange, fmt = cfg.code_style.variables },
    phpMemberSelector = { fg = c.fg },
    phpMethods        = { fg = c.cyan },
    phpNowDoc         = { fg = c.green },
    phpNumber         = { fg = c.orange },
    phpOperator       = { fg = c.purple },
    phpRegion         = { fg = c.blue },
    phpSCKeyword      = { fg = c.purple, fmt = cfg.code_style.keywords },
    phpStructure      = { fg = c.purple },
    phpVarSelector    = { fg = c.orange, fmt = cfg.code_style.variables },
}

hl.langs.scala = {
    scalaInterpolation         = { fg = c.purple },
    scalaInterpolationBoundary = { fg = c.purple },
    scalaKeywordModifier       = { fg = c.red, fmt = cfg.code_style.keywords },
    scalaNameDefinition        = { fg = c.fg },
    scalaOperator              = { fg = c.red },
    scalaTypeOperator          = { fg = c.red },
}

hl.langs.tex = {
    latexTSEnvironment     = { fg = c.cyan, fmt = "bold" },
    latexTSEnvironmentName = { fg = c.yellow },
    latexTSFuncMacro       = { fg = c.fg, fmt = cfg.code_style.functions },
    latexTSInclude         = { fg = c.blue },
    latexTSMath            = { fg = c.orange },
    latexTSTitle           = { fg = c.green },
    latexTSType            = { fg = c.blue },
    texCmd                 = { fg = c.purple },
    texCmdEnv              = { fg = c.cyan },
    texCmdPackage          = { fg = c.blue },
    texCmdPart             = { fg = c.blue },
    texEnvArgName          = { fg = c.yellow },
    texMathDelim           = { fg = c.purple },
    texMathDelimZone       = { fg = c.light_grey },
    texMathOper            = { fg = c.red },
    texMathZoneX           = { fg = c.orange },
    texMathZoneXX          = { fg = c.orange },
    texPgfType             = { fg = c.yellow },
}

hl.langs.vim = {
    vimCommentTitle = { fg = c.light_grey, fmt = cfg.code_style.comments },
    vimMap          = { fg = c.purple },
    vimMapLhs       = { fg = c.fg },
    vimMapModKey    = { fg = c.orange },
    vimMapRhs       = { fg = c.blue },
    vimNotation     = { fg = c.red },
    vimOption       = { fg = c.red },
    vimSetEqual     = { fg = c.yellow },
    vimVar          = { fg = c.fg, fmt = cfg.code_style.variables },
}

local lsp_kind_icons_color = {
    Array         = c.yellow,
    Boolean       = c.orange,
    Class         = c.yellow,
    Color         = c.green,
    Constant      = c.orange,
    Constructor   = c.blue,
    Default       = c.purple,
    Enum          = c.purple,
    EnumMember    = c.yellow,
    Event         = c.yellow,
    Field         = c.purple,
    File          = c.blue,
    Folder        = c.orange,
    Function      = c.blue,
    Interface     = c.green,
    Key           = c.cyan,
    Keyword       = c.cyan,
    Method        = c.blue,
    Module        = c.orange,
    Namespace     = c.red,
    Null          = c.grey,
    Number        = c.orange,
    Object        = c.red,
    Operator      = c.red,
    Package       = c.yellow,
    Property      = c.cyan,
    Reference     = c.orange,
    Snippet       = c.red,
    String        = c.green,
    Struct        = c.purple,
    Text          = c.light_grey,
    TypeParameter = c.red,
    Unit          = c.green,
    Value         = c.orange,
    Variable      = c.purple,
}

function M.setup()
    -- define cmp and aerial kind highlights with lsp_kind_icons_color
    for kind, color in pairs(lsp_kind_icons_color) do
        hl.plugins.cmp["CmpItemKind" .. kind] = { fg = color, fmt = cfg.cmp_itemkind_reverse and "reverse" }
        hl.plugins.outline["Aerial" .. kind .. "Icon"] = { fg = color }
        hl.plugins.navic["NavicIcons" .. kind] = { fg = color }
    end

    vim_highlights(hl.common)
    vim_highlights(hl.syntax)
    vim_highlights(hl.treesitter)
    for _, group in pairs(hl.langs) do vim_highlights(group) end
    for _, group in pairs(hl.plugins) do vim_highlights(group) end

    -- user defined highlights: vim_highlights function cannot be used because it sets an attribute to none if not specified
    local function replace_color(prefix, color_name)
        if not color_name then return "" end
        if color_name:sub(1, 1) == '$' then
            local name = color_name:sub(2, -1)
            color_name = c[name]
            if not color_name then
                vim.schedule(function()
                    vim.notify('onedark.nvim: unknown color "' .. name .. '"', vim.log.levels.ERROR,
                        { title = "onedark.nvim" })
                end)
                return ""
            end
        end
        return prefix .. "=" .. color_name
    end

    for group_name, group_settings in pairs(vim.g.onedark_config.highlights) do
        vim.api.nvim_command(string.format("highlight %s %s %s %s %s", group_name,
            replace_color("guifg", group_settings.fg),
            replace_color("guibg", group_settings.bg),
            replace_color("guisp", group_settings.sp),
            replace_color("gui", group_settings.fmt)))
    end
end

return M
