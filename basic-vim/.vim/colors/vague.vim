" vibe coded based on https://github.com/vague-theme/vague.nvim

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="vague"

" ===============================================================
" Color Palette
" ===============================================================

let s:bg          = "#141415"
let s:inactiveBg  = "#1c1c24"
let s:fg          = "#cdcdcd"
let s:floatBorder = "#878787"
let s:line        = "#252530"
let s:comment     = "#606079"
let s:builtin     = "#b4d4cf"
let s:func        = "#c48282"
let s:string      = "#e8b589"
let s:number      = "#e0a363"
let s:property    = "#c3c3d5"
let s:constant    = "#aeaed1"
let s:parameter   = "#bb9dbd"
let s:visual      = "#333738"
let s:error       = "#d8647e"
let s:warning     = "#f3be7c"
let s:hint        = "#7e98e8"
let s:operator    = "#90a0b5"
let s:keyword     = "#6e94b2"
let s:type        = "#9bb4bc"
let s:search      = "#405065"
let s:plus        = "#7fa563"
let s:delta       = "#f3be7c"

" Blended colors (pre-calculated for diff backgrounds)
let s:diffAdd     = "#293125"
let s:diffChange  = "#41362a"
let s:diffDelete  = "#3b242a"
let s:diffText    = "#6d583e"

" Terminal colors
let g:terminal_color_0  = s:line
let g:terminal_color_1  = s:error
let g:terminal_color_2  = s:plus
let g:terminal_color_3  = s:warning
let g:terminal_color_4  = s:keyword
let g:terminal_color_5  = s:parameter
let g:terminal_color_6  = s:constant
let g:terminal_color_7  = s:fg
let g:terminal_color_8  = s:comment
let g:terminal_color_9  = "#e08398"
let g:terminal_color_10 = "#99b782"
let g:terminal_color_11 = "#f5cb96"
let g:terminal_color_12 = "#8ba9c1"
let g:terminal_color_13 = "#c9b1ca"
let g:terminal_color_14 = "#bebeda"
let g:terminal_color_15 = "#d7d7d7"

" ===============================================================
" Highlight Function
" ===============================================================

function! s:hi(group, fg, bg, attr, sp, cterm_attr)
  let l:cmd = "hi " . a:group
  if a:fg != ""
    let l:cmd .= " guifg=" . a:fg
  endif
  if a:bg != ""
    let l:cmd .= " guibg=" . a:bg
  endif
  if a:attr != ""
    let l:cmd .= " gui=" . a:attr
    let l:cmd .= " term=" . a:attr
  endif
  if a:sp != ""
    let l:cmd .= " guisp=" . a:sp
  endif
  if a:cterm_attr != ""
    let l:cmd .= " cterm=" . a:cterm_attr
  endif
  execute l:cmd
endfunction

" ===============================================================
" UI Highlights
" ===============================================================

call s:hi("ColorColumn", "", s:line, "", "", "")
call s:hi("Conceal", s:func, "", "", "", "")
call s:hi("CurSearch", s:fg, s:search, "", "", "")
call s:hi("Cursor", "", "", "reverse", "", "reverse")
call s:hi("CursorColumn", "", s:line, "", "", "")
call s:hi("CursorLine", "", s:line, "NONE", "", "NONE")
call s:hi("CursorLineNr", s:fg, "NONE", "", "", "NONE")
call s:hi("Debug", s:constant, "", "", "", "")
call s:hi("debugPC", s:bg, s:fg, "", "", "")
call s:hi("debugBreakpoint", s:bg, s:operator, "", "", "")
call s:hi("Directory", s:hint, "", "", "", "")
call s:hi("OkMsg", s:plus, "", "", "", "")
call s:hi("ErrorMsg", s:error, "NONE", "bold", "", "bold")
call s:hi("EndOfBuffer", s:comment, "", "", "", "")
call s:hi("FloatBorder", s:floatBorder, s:bg, "", "", "")
call s:hi("FloatTitle", s:floatBorder, s:bg, "", "", "")
call s:hi("FloatFooter", s:floatBorder, s:bg, "", "", "")
call s:hi("Folded", s:comment, s:line, "", "", "")
call s:hi("FoldColumn", s:comment, s:bg, "", "", "")
call s:hi("IncSearch", s:bg, s:search, "NONE", "", "NONE")
call s:hi("LineNr", s:comment, "", "", "", "")
call s:hi("MatchParen", s:fg, s:visual, "", "", "")
call s:hi("MoreMsg", s:func, "", "bold", "", "bold")
call s:hi("MsgSeparator", s:string, s:line, "bold", "", "bold")
call s:hi("NonText", s:comment, "", "", "", "")
call s:hi("Normal", s:fg, s:bg, "", "", "")
call s:hi("NormalFloat", s:fg, s:bg, "", "", "")
call s:hi("ModeMsg", s:string, "", "bold", "", "bold")
call s:hi("Pmenu", s:fg, s:bg, "", "", "")
call s:hi("PmenuSel", s:constant, s:line, "", "", "")
call s:hi("PmenuThumb", "", s:comment, "", "", "")
call s:hi("PmenuSbar", "", s:line, "", "", "")
call s:hi("Question", s:constant, "", "", "", "")
call s:hi("QuickFixLine", s:func, "", "underline", "", "underline")
call s:hi("Search", s:fg, s:search, "", "", "")
call s:hi("SignColumn", s:fg, s:bg, "", "", "")
call s:hi("SpecialKey", s:comment, "", "", "", "")
call s:hi("SpellBad", s:fg, s:bg, "undercurl", s:error, "underline")
call s:hi("SpellCap", s:fg, s:bg, "undercurl", s:hint, "underline")
call s:hi("SpellLocal", s:fg, s:bg, "undercurl", s:warning, "underline")
call s:hi("SpellRare", s:fg, s:bg, "undercurl", s:hint, "underline")
call s:hi("StatusLine", s:fg, s:inactiveBg, "bold,reverse", "", "bold,reverse")
call s:hi("StatusLineTerm", s:fg, s:inactiveBg, "bold", "", "bold")
call s:hi("StatusLineNC", s:comment, "", "reverse", "", "reverse")
call s:hi("StatusLineTermNC", s:comment, "", "reverse", "", "reverse")
call s:hi("Substitute", s:type, s:visual, "", "", "")
call s:hi("TabLine", s:fg, s:line, "", "", "")
call s:hi("TabLineFill", s:comment, s:line, "", "", "")
call s:hi("TabLineSel", s:bg, s:fg, "", "", "")
call s:hi("Terminal", s:fg, s:bg, "", "", "")
call s:hi("Title", s:property, "", "", "", "")
call s:hi("ToolbarButton", s:bg, s:visual, "", "", "")
call s:hi("ToolbarLine", s:fg, "", "", "", "")
call s:hi("Visual", "", s:visual, "", "", "")
call s:hi("VisualNOS", "", s:comment, "underline", "", "underline")
call s:hi("WarningMsg", s:warning, "", "bold", "", "bold")
call s:hi("Whitespace", s:line, "", "", "", "")
call s:hi("WildMenu", s:bg, s:func, "", "", "")
call s:hi("WinSeparator", s:floatBorder, "", "", "", "")
call s:hi("VertSplit", s:floatBorder, "", "", "", "NONE")

" ===============================================================
" Syntax Highlights
" ===============================================================

call s:hi("Boolean", s:number, "", "bold", "", "bold")
call s:hi("Character", s:string, "", "", "", "")
call s:hi("Comment", s:comment, "", "italic", "", "italic")
call s:hi("Conditional", s:keyword, "", "", "", "")
call s:hi("Constant", s:constant, "", "", "", "")
call s:hi("Define", s:comment, "", "", "", "")
call s:hi("Delimiter", s:fg, "", "", "", "")
call s:hi("Error", s:error, "NONE", "bold", "", "bold")
call s:hi("Exception", s:keyword, "", "", "", "")
call s:hi("Float", s:number, "", "", "", "")
call s:hi("Function", s:func, "", "", "", "")
call s:hi("Identifier", s:constant, "", "", "", "")
call s:hi("Include", s:keyword, "", "", "", "")
call s:hi("Keyword", s:keyword, "", "", "", "")
call s:hi("Label", s:keyword, "", "", "", "")
call s:hi("Macro", s:constant, "", "", "", "")
call s:hi("Number", s:number, "", "", "", "")
call s:hi("Operator", s:operator, "", "", "", "")
call s:hi("PreCondit", s:comment, "", "", "", "")
call s:hi("PreProc", s:constant, "", "", "", "")
call s:hi("Repeat", s:keyword, "", "", "", "")
call s:hi("Special", s:builtin, "", "", "", "")
call s:hi("SpecialChar", s:keyword, "", "", "", "")
call s:hi("SpecialComment", s:keyword, "", "", "", "")
call s:hi("Statement", s:keyword, "", "", "", "")
call s:hi("StorageClass", s:constant, "", "", "", "")
call s:hi("String", s:string, "", "", "", "")
call s:hi("Structure", s:constant, "", "", "", "")
call s:hi("Tag", s:builtin, "", "", "", "")
call s:hi("Todo", s:func, s:bg, "italic", "", "italic")
call s:hi("Type", s:type, "", "bold", "", "bold")
call s:hi("Typedef", s:constant, "", "", "", "")

" ===============================================================
" Diff Highlights
" ===============================================================

call s:hi("Added", s:plus, "", "", "", "")
call s:hi("Changed", s:delta, "", "", "", "")
call s:hi("Removed", s:error, "", "", "", "")
call s:hi("DiffAdd", "", s:diffAdd, "", "", "")
call s:hi("DiffChange", "", s:diffChange, "", "", "")
call s:hi("DiffDelete", "", s:diffDelete, "", "", "")
call s:hi("DiffText", "", s:diffText, "", "", "")
call s:hi("DiffFile", s:keyword, "", "", "", "")
call s:hi("DiffIndexLine", s:comment, "", "", "", "")

" ===============================================================
" Git Signs
" ===============================================================

call s:hi("GitSignsAdd", s:plus, "", "", "", "")
call s:hi("GitSignsChange", s:delta, "", "", "", "")
call s:hi("GitSignsDelete", s:error, "", "", "", "")
call s:hi("GitSignsCurrentLineBlame", s:comment, "", "italic", "", "italic")

" ===============================================================
" Diagnostics (LSP)
" ===============================================================

call s:hi("DiagnosticError", s:error, "", "bold", "", "bold")
call s:hi("DiagnosticWarn", s:warning, "", "bold", "", "bold")
call s:hi("DiagnosticInfo", s:constant, "", "italic", "", "italic")
call s:hi("DiagnosticHint", s:hint, "", "", "", "")
call s:hi("DiagnosticOk", s:plus, "", "", "", "")
call s:hi("DiagnosticUnderlineError", "", "", "undercurl", s:error, "underline")
call s:hi("DiagnosticUnderlineWarn", "", "", "undercurl", s:warning, "underline")
call s:hi("DiagnosticUnderlineInfo", "", "", "undercurl", s:constant, "underline")
call s:hi("DiagnosticUnderlineHint", "", "", "undercurl", s:hint, "underline")
call s:hi("DiagnosticVirtualTextError", s:error, "", "bold", "", "bold")
call s:hi("DiagnosticVirtualTextWarn", s:warning, "", "bold", "", "bold")
call s:hi("DiagnosticVirtualTextInfo", s:constant, "", "italic", "", "italic")
call s:hi("DiagnosticVirtualTextHint", s:hint, "", "", "", "")
call s:hi("DiagnosticSignError", s:error, "", "", "", "")
call s:hi("DiagnosticSignWarn", s:warning, "", "", "", "")
call s:hi("DiagnosticSignInfo", s:hint, "", "", "", "")
call s:hi("DiagnosticSignHint", s:hint, "", "", "", "")

" ===============================================================
" LSP Semantic Tokens (Neovim only)
" ===============================================================

if has('nvim')
  call s:hi("@lsp.type.namespace", s:constant, "", "", "", "")
  call s:hi("@lsp.type.type", s:type, "", "", "", "")
  call s:hi("@lsp.type.class", s:type, "", "", "", "")
  call s:hi("@lsp.type.enum", s:type, "", "", "", "")
  call s:hi("@lsp.type.interface", s:type, "", "", "", "")
  call s:hi("@lsp.type.struct", s:type, "", "", "", "")
  call s:hi("@lsp.type.parameter", s:parameter, "", "", "", "")
  call s:hi("@lsp.type.variable", s:fg, "", "", "", "")
  call s:hi("@lsp.type.property", s:property, "", "", "", "")
  call s:hi("@lsp.type.enumMember", s:constant, "", "", "", "")
  call s:hi("@lsp.type.function", s:func, "", "", "", "")
  call s:hi("@lsp.type.method", s:func, "", "", "", "")
  call s:hi("@lsp.type.macro", s:constant, "", "", "", "")
  call s:hi("@lsp.type.decorator", s:builtin, "", "", "", "")
endif

" ===============================================================
" Treesitter Highlights (Neovim only)
" ===============================================================

if has('nvim')
  call s:hi("@variable", s:fg, "", "", "", "")
  call s:hi("@variable.builtin", s:builtin, "", "bold", "", "bold")
  call s:hi("@variable.parameter", s:parameter, "", "", "", "")
  call s:hi("@variable.member", s:property, "", "", "", "")
  call s:hi("@constant", s:constant, "", "", "", "")
  call s:hi("@constant.builtin", s:number, "", "bold", "", "bold")
  call s:hi("@constant.macro", s:constant, "", "", "", "")
  call s:hi("@module", s:constant, "", "", "", "")
  call s:hi("@label", s:keyword, "", "", "", "")
  call s:hi("@string", s:string, "", "italic", "", "italic")
  call s:hi("@string.documentation", s:comment, "", "italic", "", "italic")
  call s:hi("@string.regexp", s:keyword, "", "", "", "")
  call s:hi("@string.escape", s:keyword, "", "", "", "")
  call s:hi("@string.special.url", s:func, "", "", "", "")
  call s:hi("@character", s:string, "", "", "", "")
  call s:hi("@character.special", s:keyword, "", "", "", "")
  call s:hi("@boolean", s:number, "", "bold", "", "bold")
  call s:hi("@number", s:number, "", "", "", "")
  call s:hi("@number.float", s:number, "", "", "", "")
  call s:hi("@type", s:type, "", "", "", "")
  call s:hi("@type.builtin", s:builtin, "", "bold", "", "bold")
  call s:hi("@type.definition", s:type, "", "", "", "")
  call s:hi("@attribute", s:constant, "", "", "", "")
  call s:hi("@property", s:property, "", "", "", "")
  call s:hi("@function", s:func, "", "", "", "")
  call s:hi("@function.builtin", s:func, "", "", "", "")
  call s:hi("@function.call", s:func, "", "", "", "")
  call s:hi("@function.macro", s:constant, "", "", "", "")
  call s:hi("@function.method", s:func, "", "", "", "")
  call s:hi("@function.method.call", s:func, "", "", "", "")
  call s:hi("@constructor", s:constant, "", "", "", "")
  call s:hi("@operator", s:operator, "", "", "", "")
  call s:hi("@keyword", s:keyword, "", "", "", "")
  call s:hi("@keyword.coroutine", s:keyword, "", "italic", "", "italic")
  call s:hi("@keyword.function", s:keyword, "", "", "", "")
  call s:hi("@keyword.operator", s:operator, "", "", "", "")
  call s:hi("@keyword.return", s:keyword, "", "italic", "", "italic")
  call s:hi("@keyword.import", s:keyword, "", "", "", "")
  call s:hi("@keyword.exception", s:keyword, "", "", "", "")
  call s:hi("@keyword.conditional", s:keyword, "", "", "", "")
  call s:hi("@keyword.repeat", s:keyword, "", "", "", "")
  call s:hi("@keyword.debug", s:constant, "", "", "", "")
  call s:hi("@keyword.directive", s:comment, "", "", "", "")
  call s:hi("@keyword.directive.define", s:comment, "", "", "", "")
  call s:hi("@punctuation.delimiter", s:fg, "", "", "", "")
  call s:hi("@punctuation.bracket", s:fg, "", "", "", "")
  call s:hi("@punctuation.special", s:keyword, "", "", "", "")
  call s:hi("@comment", s:comment, "", "italic", "", "italic")
  call s:hi("@comment.documentation", s:comment, "", "italic", "", "italic")
  call s:hi("@comment.error", s:error, "", "bold", "", "bold")
  call s:hi("@comment.warning", s:warning, "", "bold", "", "bold")
  call s:hi("@comment.todo", s:func, "", "italic", "", "italic")
  call s:hi("@comment.note", s:hint, "", "italic", "", "italic")
  call s:hi("@markup.strong", "", "", "bold", "", "bold")
  call s:hi("@markup.italic", "", "", "italic", "", "italic")
  call s:hi("@markup.strikethrough", "", "", "strikethrough", "", "NONE")
  call s:hi("@markup.underline", "", "", "underline", "", "underline")
  call s:hi("@markup.heading", s:property, "", "bold", "", "bold")
  call s:hi("@markup.heading.1", s:property, "", "bold", "", "bold")
  call s:hi("@markup.heading.2", s:property, "", "bold", "", "bold")
  call s:hi("@markup.heading.3", s:property, "", "bold", "", "bold")
  call s:hi("@markup.heading.4", s:property, "", "bold", "", "bold")
  call s:hi("@markup.heading.5", s:property, "", "bold", "", "bold")
  call s:hi("@markup.heading.6", s:property, "", "bold", "", "bold")
  call s:hi("@markup.quote", s:comment, "", "italic", "", "italic")
  call s:hi("@markup.math", s:number, "", "", "", "")
  call s:hi("@markup.link", s:hint, "", "", "", "")
  call s:hi("@markup.link.label", s:builtin, "", "", "", "")
  call s:hi("@markup.link.url", s:hint, "", "underline", "", "underline")
  call s:hi("@markup.raw", s:string, "", "", "", "")
  call s:hi("@markup.raw.block", s:string, "", "", "", "")
  call s:hi("@markup.list", s:keyword, "", "", "", "")
  call s:hi("@markup.list.checked", s:plus, "", "", "", "")
  call s:hi("@markup.list.unchecked", s:comment, "", "", "", "")
  call s:hi("@diff.plus", s:plus, "", "", "", "")
  call s:hi("@diff.minus", s:error, "", "", "", "")
  call s:hi("@diff.delta", s:delta, "", "", "", "")
  call s:hi("@tag", s:builtin, "", "", "", "")
  call s:hi("@tag.attribute", s:property, "", "", "", "")
  call s:hi("@tag.delimiter", s:fg, "", "", "", "")
endif

" ===============================================================
" Netrw
" ===============================================================

call s:hi("netrwDir", s:hint, "", "", "", "")
call s:hi("netrwClassify", s:keyword, "", "", "", "")
call s:hi("netrwLink", s:func, "", "", "", "")
call s:hi("netrwSymLink", s:string, "", "", "", "")
call s:hi("netrwExe", s:plus, "", "", "", "")
call s:hi("netrwComment", s:comment, "", "", "", "")
call s:hi("netrwList", s:fg, "", "", "", "")
call s:hi("netrwHelpCmd", s:builtin, "", "", "", "")
call s:hi("netrwCmdSep", s:fg, "", "", "", "")
call s:hi("netrwVersion", s:constant, "", "", "", "")

" ===============================================================
" Telescope
" ===============================================================

call s:hi("TelescopeBorder", s:floatBorder, "", "", "", "")
call s:hi("TelescopePromptBorder", s:floatBorder, "", "", "", "")
call s:hi("TelescopeResultsBorder", s:floatBorder, "", "", "", "")
call s:hi("TelescopePreviewBorder", s:floatBorder, "", "", "", "")
call s:hi("TelescopeSelection", s:constant, s:line, "", "", "")
call s:hi("TelescopeMatching", s:warning, "", "bold", "", "bold")

" ===============================================================
" NvimTree / Neo-tree
" ===============================================================

call s:hi("NvimTreeFolderIcon", s:hint, "", "", "", "")
call s:hi("NvimTreeFolderName", s:hint, "", "", "", "")
call s:hi("NvimTreeOpenedFolderName", s:hint, "", "", "", "")
call s:hi("NvimTreeRootFolder", s:constant, "", "bold", "", "bold")
call s:hi("NvimTreeGitDirty", s:delta, "", "", "", "")
call s:hi("NvimTreeGitNew", s:plus, "", "", "", "")
call s:hi("NvimTreeGitDeleted", s:error, "", "", "", "")
call s:hi("NvimTreeSpecialFile", s:func, "", "", "", "")
call s:hi("NvimTreeIndentMarker", s:comment, "", "", "", "")

call s:hi("NeoTreeDirectoryIcon", s:hint, "", "", "", "")
call s:hi("NeoTreeDirectoryName", s:hint, "", "", "", "")
call s:hi("NeoTreeRootName", s:constant, "", "bold", "", "bold")
call s:hi("NeoTreeGitModified", s:delta, "", "", "", "")
call s:hi("NeoTreeGitAdded", s:plus, "", "", "", "")
call s:hi("NeoTreeGitDeleted", s:error, "", "", "", "")
call s:hi("NeoTreeGitUntracked", s:string, "", "", "", "")

" ===============================================================
" Completion Menu (cmp, etc.)
" ===============================================================

call s:hi("CmpItemAbbrMatch", s:warning, "", "bold", "", "bold")
call s:hi("CmpItemAbbrMatchFuzzy", s:warning, "", "bold", "", "bold")
call s:hi("CmpItemKindVariable", s:parameter, "", "", "", "")
call s:hi("CmpItemKindInterface", s:type, "", "", "", "")
call s:hi("CmpItemKindFunction", s:func, "", "", "", "")
call s:hi("CmpItemKindMethod", s:func, "", "", "", "")
call s:hi("CmpItemKindKeyword", s:keyword, "", "", "", "")
call s:hi("CmpItemKindProperty", s:property, "", "", "", "")
call s:hi("CmpItemKindUnit", s:number, "", "", "", "")

" ===============================================================
" Dashboard
" ===============================================================

call s:hi("DashboardHeader", s:constant, "", "", "", "")
call s:hi("DashboardCenter", s:constant, "", "", "", "")
call s:hi("DashboardShortCut", s:keyword, "", "", "", "")
call s:hi("DashboardFooter", s:comment, "", "italic", "", "italic")

" ===============================================================
" Misc Plugin Support
" ===============================================================

" Indent guides
call s:hi("IndentBlanklineChar", s:line, "", "", "", "")
call s:hi("IndentBlanklineContextChar", s:comment, "", "", "", "")

" Which-key
call s:hi("WhichKey", s:func, "", "", "", "")
call s:hi("WhichKeyGroup", s:keyword, "", "", "", "")
call s:hi("WhichKeyDesc", s:fg, "", "", "", "")
call s:hi("WhichKeySeparator", s:comment, "", "", "", "")

" Hop
call s:hi("HopNextKey", s:error, "", "bold", "", "bold")
call s:hi("HopNextKey1", s:warning, "", "bold", "", "bold")
call s:hi("HopNextKey2", s:hint, "", "", "", "")
call s:hi("HopUnmatched", s:comment, "", "", "", "")

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
