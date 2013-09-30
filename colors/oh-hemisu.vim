" hemisu.vim - Vim color scheme
" ----------------------------------------------------------
" Author:	Noah Frederick (http://noahfrederick.com/)
" Version:	3.4
" License:	Creative Commons Attribution-NonCommercial
" 			3.0 Unported License       (see README.md)
" ----------------------------------------------------------

" Setup ----------------------------------------------------{{{
" Reset syntax highlighting
hi clear
if exists("syntax_on")
	syntax reset
endif

" Declare theme name
let g:colors_name="oh-hemisu"

"}}}
" The Colors -----------------------------------------------{{{
" Define reusable colors
let s:black=           { "gui": "#1C1C1C", "cterm": "234" }
let s:white=           { "gui": "#FFFFFF", "cterm": "231" }
let s:almostWhite=     { "gui": "#EEEEEE", "cterm": "255" }
let s:almostBlack=     { "gui": "#111111", "cterm": "233" }
let s:middleDarkGrey=  { "gui": "#777777", "cterm": "241" }
let s:middleLightGrey= { "gui": "#999999", "cterm": "246" }
let s:lightGrey=       { "gui": "#BBBBBB", "cterm": "249" }
let s:darkGrey=        { "gui": "#444444", "cterm": "237" }

let s:darkPink=        { "gui": "#63001C", "cterm": "88"  }
let s:middleDarkPink=  { "gui": "#FF0055", "cterm": "197" }
let s:middleLightPink= { "gui": "#D65E76", "cterm": "167" }
let s:lightPink=       { "gui": "#FFAFAF", "cterm": "217" }

let s:darkBlue=        { "gui": "#005F87", "cterm": "24"  }
let s:middleDarkBlue=  { "gui": "#538192", "cterm": "24"  }
let s:middleLightBlue= { "gui": "#9FD3E6", "cterm": "116" }
let s:lightBlue=       { "gui": "#CBE4EE", "cterm": "195" }

let s:darkGreen=       { "gui": "#5F5F00", "cterm": "58"  }
let s:middleDarkGreen= { "gui": "#739200", "cterm": "64"  }
let s:middleLightGreen={ "gui": "#B1D631", "cterm": "149" }
let s:lightGreen=      { "gui": "#BBFFAA", "cterm": "157" }

let s:darkTan=         { "gui": "#503D15", "cterm": "52"  }
let s:lightTan=        { "gui": "#ECE1C8", "cterm": "230" }

" Borrowed from Smyck
let s:yellow = { "gui": "#F6DC69", "cterm": "3" }
let s:green = { "gui": "#D1FA71", "cterm": "155" }

" Assign to semantic categories based on background color
" Dark theme
let s:bg=s:black
let s:norm=s:almostWhite
let s:comment=s:middleDarkGrey
let s:dimmed=s:middleLightGrey
let s:subtle=s:darkGrey
let s:faint=s:almostBlack
let s:faint2=s:almostBlack
let s:accent1=s:middleLightBlue
"let s:accent2=s:middleLightGreen
let s:accent2=s:yellow
"let s:accent3=s:lightGreen
let s:accent3=s:green
let s:accent4=s:lightTan
let s:normRed=s:middleLightPink
let s:normGreen=s:middleLightGreen
let s:normBlue=s:middleLightBlue
let s:faintRed=s:darkPink
let s:faintGreen=s:darkGreen
let s:faintBlue=s:darkBlue

"}}}
" Utilility Function ---------------------------------------{{{
function! s:h(group, style)
	execute "highlight" a:group
		\ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
		\ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
		\ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
		\ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
		\ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
		\ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
		\ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

"}}}
" Highlights - Vim >= 7 ------------------------------------{{{
if version >= 700
	call s:h("CursorLine",  { "bg": s:faintBlue})
	call s:h("MatchParen",  { "fg": s:accent1, "bg": s:faint2, "gui": "bold" })
	call s:h("Pmenu",       { "fg": s:almostWhite, "bg": s:subtle})
	call s:h("PmenuThumb",  { "bg": s:subtle })
	call s:h("PmenuSBar",   { "bg": s:almostBlack })
	call s:h("PmenuSel",    { "bg": s:faintBlue })
	call s:h("ColorColumn", { "bg": s:subtle })
	call s:h("SpellBad",    { "sp": s:normRed, "gui": "undercurl" })
	call s:h("SpellCap",    { "sp": s:accent1, "gui": "undercurl" })
	call s:h("SpellRare",   { "sp": s:normGreen, "gui": "undercurl" })
	call s:h("SpellLocal",  { "sp": s:accent4, "gui": "undercurl" })
	hi! link CursorColumn	CursorLine

	" Use background for cterm Spell*, which does not support undercurl
	execute "hi! SpellBad   ctermbg=" s:faintRed.cterm
	execute "hi! SpellCap   ctermbg=" s:faintBlue.cterm
	execute "hi! SpellRare  ctermbg=" s:faintGreen.cterm
	execute "hi! SpellLocal ctermbg=" s:faint2.cterm
endif

"}}}
" Highlights - UI ------------------------------------------{{{
call s:h("Normal",       { "fg": s:norm, "bg": s:bg })
call s:h("NonText",      { "fg": s:subtle })
call s:h("Cursor",       { "fg": s:bg, "bg": s:middleLightPink})
call s:h("Visual",       { "bg": s:faintBlue })
call s:h("IncSearch",    { "fg": s:norm, "bg": s:middleLightPink})
call s:h("Search",       { "fg": s:norm, "bg": s:faintBlue })
call s:h("StatusLine",   { "fg": s:norm, "bg": s:faint2, "gui": "bold", "cterm": "bold" })
call s:h("StatusLineNC", { "fg": s:dimmed, "bg": s:faint2 })
call s:h("SignColumn",   { "fg": s:norm })
call s:h("VertSplit",    { "fg": s:almostBlack, "bg": s:faint2 })
call s:h("TabLine",      { "fg": s:dimmed, "bg": s:faint2 })
call s:h("TabLineSel",   { "gui": "bold", "cterm": "bold" })
call s:h("Folded",       { "fg": s:comment, "bg": s:faint2 })
call s:h("Directory",    { "fg": s:accent1 })
call s:h("Title",        { "fg": s:accent4, "gui": "bold", "cterm": "bold" })
call s:h("ErrorMsg",     { "fg": s:normRed})
call s:h("DiffAdd",      { "fg": s:normGreen })
call s:h("DiffChange",   { "fg": s:normBlue })
call s:h("DiffDelete",   { "fg": s:normRed })
call s:h("DiffText",     { "bg": s:faintRed, "gui": "bold", "cterm": "bold" })
call s:h("User1",        { "fg": s:bg, "bg": s:normGreen })
call s:h("User2",        { "fg": s:bg, "bg": s:normRed })
call s:h("User3",        { "fg": s:bg, "bg": s:normBlue })
hi! link WildMenu	IncSearch
hi! link FoldColumn	SignColumn
hi! link WarningMsg	ErrorMsg
hi! link MoreMsg	Title
hi! link Question	MoreMsg
hi! link ModeMsg	MoreMsg
hi! link TabLineFill	StatusLineNC
hi! link LineNr		NonText
hi! link SpecialKey	NonText

"}}}
" Highlights - Generic Syntax ------------------------------{{{
call s:h("Delimiter",  { "fg": s:dimmed })
call s:h("Comment",    { "fg": s:comment, "gui": "italic" })
call s:h("Underlined", { "fg": s:accent1, "gui": "underline", "cterm": "underline" })
call s:h("Type",       { "fg": s:accent3 })
call s:h("String",     { "fg": s:accent2 })
call s:h("Keyword",    { "fg": s:accent2, "gui": "bold", "cterm": "bold" })
call s:h("Todo",       { "fg": s:normRed, "gui": "bold", "cterm": "bold" })
call s:h("Function",   { "fg": s:lightBlue })
call s:h("Identifier", { "fg": s:lightTan })

hi! link Statement	Type
hi! link Constant	Directory
hi! link Number		Constant
hi! link Special	Constant
hi! link PreProc	Constant
hi! link Error		ErrorMsg

"}}}
" Highlights - HTML ----------------------------------------{{{
hi! link htmlLink	Underlined
hi! link htmlTag	Type
hi! link htmlEndTag	htmlTag

"}}}
" Highlights - CSS -----------------------------------------{{{
hi! link cssBraces	Delimiter
hi! link cssSelectorOp	cssBraces
hi! link cssClassName Function
hi! link cssDefinition Identifier
hi! link cssFontProp Identifier
hi! link cssFontAttr Identifier
hi! link cssCommonAttr Identifier
hi! link cssFontDescriptorProp Identifier
hi! link cssFontDescriptorAttr Identifier
hi! link cssColorProp Identifier
hi! link cssColorAttr Identifier
hi! link cssTextProp Identifier
hi! link cssTextAttr Identifier
hi! link cssBoxProp Identifier
hi! link cssBoxAttr Identifier
hi! link cssGeneratedContentProp Identifier
hi! link cssGeneratedContentAttr Identifier
hi! link cssAuralAttr Identifier
hi! link cssPagingProp Identifier
hi! link cssPagingAttr Identifier
hi! link cssUIProp Identifier
hi! link cssUIAttr Identifier
hi! link cssRenderAttr Identifier
hi! link cssRenderProp Identifier
hi! link cssAuralProp Identifier
hi! link cssTableProp Identifier
hi! link cssTableAttr Identifier

"}}}
" Highlights - Markdown ------------------------------------{{{
hi! link mkdListItem	mkdDelimiter
hi! link markdownCode	Function
hi! link markdownCodeBlock	Function

"}}}
" Highlights - Shell ---------------------------------------{{{
hi! link shOperator	Delimiter
hi! link shCaseBar	Delimiter

"}}}
" Highlights - JavaScript ----------------------------------{{{
hi! link javaScriptValue	Constant
hi! link javaScriptNull	Constant
hi! link javaScriptBraces	Normal

" Highlights - PHP ----------------------------------{{{
"hi! link phpIdentifier Identifier
"hi! link phpStatement Statement
"hi! link phpFunctions Function
"hi! link phpKeyword Keyword
call s:h("phpVarSelector", { "fg": s:comment })

hi link doxygenComment Comment
hi link doxygenBrief Comment
hi link doxygenBody Comment
hi link doxygenParam Directory
hi link doxygenOther Comment
hi link doxygenParamName Conditional
hi link doxygenSpecialTypeOnelineDesc Comment
hi link doxygenSpecialMultilineDesc Comment

"}}}

" Highlights - CtrlP ----------------------------------{{{
call s:h("CtrlPLinePre", { "fg": s:subtle, "gui": "bold"})
call s:h("CtrlPMatch", { "fg": s:almostWhite, "bg": s:faintBlue, "gui": "bold"})
"}}}

" Highlights - NERDTree ----------------------------------{{{
hi link NERDTreeBookmark Delimiter
hi link NERDTreeBookmarkName Identifier
"}}}

" Highlights - Diff ----------------------------------------{{{
hi! link diffRemoved DiffDelete
hi! link diffAdded DiffAdd
hi! link diffFile Type
hi! link diffLine Type

"}}}

" Highlights - Help ----------------------------------------{{{
hi! link helpExample	String
hi! link helpHeadline	Title
hi! link helpSectionDelim	Comment
hi! link helpHyperTextEntry	Statement
hi! link helpHyperTextJump	Underlined
hi! link helpURL	Underlined

"}}}

" Highlights - ShowMarker -----------------------------------{{{
call s:h("ShowMarksHLl", { "fg": s:darkPink, "gui": "bold" })
call s:h("ShowMarksHLo", { "fg": s:bg })

" }}}

" Highlights - eZ Publish -----------------------------------{{{
hi! link ezpConditional Keyword

" }}}

" vim: fdm=marker
