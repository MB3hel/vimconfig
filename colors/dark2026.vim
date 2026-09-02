" Port of https://github.com/D0nw0r/dark2026.nvim/tree/master
" for vim and neovim in vimscript
" Original work in lua: MIT License
"     
"     Copyright (c) 2026 D0nw0r
"     
"     Permission is hereby granted, free of charge, to any person obtaining a copy
"     of this software and associated documentation files (the "Software"), to deal
"     in the Software without restriction, including without limitation the rights
"     to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
"     copies of the Software, and to permit persons to whom the Software is
"     furnished to do so, subject to the following conditions:
"     
"     The above copyright notice and this permission notice shall be included in all
"     copies or substantial portions of the Software.
"     
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
"     IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
"     FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
"     AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
"     LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
"     OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
"     SOFTWARE.



" --------------------------------------------------------------------------------------------------
" Color definitions
" --------------------------------------------------------------------------------------------------

" Backgrounds (darkest -> lightest)
let s:bg          = '#121314'   " editor
let s:bg_alt      = '#191a1b'   " sidebar / status / panel / inactive tabs
let s:bg_menu     = '#202122'   " menu / quick input
let s:bg_line     = '#242526'   " line highlight, hover
let s:bg_widget   = '#262728'   " widget hover
let s:bg_select   = '#276782'   " selection (no alpha — gui hex needs solid)
let s:bg_match    = '#27678290'
let s:border      = '#2a2b2c'
let s:border_alt  = '#333536'

" Foregrounds
let s:fg          = '#bbbebf'
let s:fg_alt      = '#bfbfbf'
let s:fg_dim      = '#8c8c8c'
let s:fg_muted    = '#555555'
let s:white       = '#ffffff'

" Accent (cyan/blue)
let s:accent      = '#3994bc'
let s:accent_dim  = '#297aa0'
let s:accent_alt  = '#48a0c7'

" Syntax (Dark 2026 / GitHub Dark style — red keywords, purple functions)
let s:comment     = '#8B949E'
let s:string      = '#A5D6FF'
let s:regex       = '#7EE787'
let s:number      = '#79C0FF'
let s:keyword     = '#FF7B72' " red
let s:func        = '#D2A8FF' " purple
let s:type        = '#4EC9B0' " teal/green for types (ExitCode, ElevationStatus, ...)
let s:variable    = '#bbbebf' " default fg (plain ident)
let s:constant    = '#79C0FF'
let s:operator    = '#FF7B72'
let s:preproc     = '#FF7B72' " return/import/throw — red control flow
let s:annotation  = '#FFA657'
let s:param       = '#FFA657'
let s:member      = '#79C0FF' " field/property
let s:tag         = '#7EE787'
let s:attr        = '#79C0FF'
let s:module      = '#4EC9B0' " module/namespace — same teal-green as types
let s:macro       = '#48a0c7' " println!, eprintln! — darker blue than constants

" Diagnostics / status
let s:err         = '#F44747'
let s:warn        = '#CD9731'
let s:info        = '#6796E6'
let s:hint        = '#3a94bc'
let s:debug       = '#B267E6'

" Diff
let s:diff_add    = '#1b3a1b'
let s:diff_add_fg = '#7EE787'
let s:diff_del    = '#3a1b1b'
let s:diff_del_fg = '#FFA198'
let s:diff_chg    = '#2a2a4a'

" --------------------------------------------------------------------------------------------------



" --------------------------------------------------------------------------------------------------
" Color scheme settings
" --------------------------------------------------------------------------------------------------

set background=dark
let g:colors_name = "dark2026"

hi  clear
syntax reset

" Editor / UI
execute 'hi  Normal             guifg=' . s:fg . ' guibg=' .  s:bg
execute 'hi  NormalNC           guifg=' . s:fg . ' guibg=' . s:bg
execute 'hi  NormalFloat        guifg=' . s:fg . ' guibg=' . s:bg_menu
execute 'hi  FloatBorder        guifg=' . s:border_alt . ' guibg=' . s:bg_menu
execute 'hi  FloatTitle         guifg=' . s:fg_alt . ' guibg=' . s:bg_menu . ' gui=bold cterm=bold'
execute 'hi  NonText            guifg=' . s:fg_muted
execute 'hi  EndOfBuffer        guifg=' . s:bg
execute 'hi  Whitespace         guifg=' . s:fg_muted
execute 'hi  SpecialKey         guifg=' . s:fg_muted
execute 'hi  Conceal            guifg=' . s:fg_dim

execute 'hi  Cursor             guifg=' . s:bg . ' guibg=' . s:fg
execute 'hi  CursorLine         guibg=' . s:bg_line
execute 'hi  CursorColumn       guibg=' . s:bg_line
execute 'hi  ColorColumn        guibg=' . s:bg_line
execute 'hi  LineNr             guifg=' . s:fg_muted
execute 'hi  CursorLineNr       guifg=' . s:fg_alt . 'gui=bold cterm=bold'
execute 'hi  SignColumn         guibg=' . s:bg
execute 'hi  FoldColumn         guifg=' . s:fg_muted . ' guibg=' . s:bg
execute 'hi  Folded             guifg=' . s:fg_dim . ' guibg=' . s:bg_line

execute 'hi  Visual             guibg=' . s:bg_select
execute 'hi  VisualNOS          guibg=' . s:bg_select
execute 'hi  Search             guifg=' . s:fg . ' guibg=' . s:bg_select
execute 'hi  IncSearch          guifg=' . s:white . ' guibg=' . s:accent
execute 'hi  CurSearch          guifg=' . s:white . ' guibg=' . s:accent
execute 'hi  MatchParen         guifg=' . s:accent_alt . ' gui=bold cterm=bold gui=underline cterm=underline'

execute 'hi  StatusLine         guifg=' . s:fg_dim . ' guibg=' . s:bg_alt
execute 'hi  StatusLineNC       guifg=' . s:fg_muted . ' guibg=' . s:bg_alt
execute 'hi  WinSeparator       guifg=' . s:border . ' guibg=' . s:bg
execute 'hi  VertSplit          guifg=' . s:border . ' guibg=' . s:bg

execute 'hi  TabLine            guifg=' . s:fg_dim . ' guibg=' . s:bg_alt
execute 'hi  TabLineFill        guibg=' . s:bg_alt
execute 'hi  TabLineSel         guifg=' . s:fg_alt . ' guibg=' . s:bg . ' guisp=' . s:accent . ' gui=underline cterm=underline'

" Popup menus / completion
execute 'hi  Pmenu              guifg=' . s:fg . ' guibg=' . s:bg_menu
execute 'hi  PmenuSel           guifg=' . s:fg_alt . ' guibg=' . s:accent_dim
execute 'hi  PmenuSbar          guibg=' . s:bg_line
execute 'hi  PmenuThumb         guibg=' . s:fg_muted
execute 'hi  PmenuKind          guifg=' . s:func . ' guibg=' . s:bg_menu
execute 'hi  PmenuKindSel       guifg=' . s:func . ' guibg=' . s:accent_dim
execute 'hi  PmenuExtra         guifg=' . s:fg_dim . ' guibg=' . s:bg_menu
execute 'hi  PmenuExtraSel      guifg=' . s:fg_alt . ' guibg=' . s:accent_dim
execute 'hi  PmenuMatch         guifg=' . s:accent_alt . ' gui=bold cterm=bold'
execute 'hi  PmenuMatchSel      guifg=' . s:accent_alt . ' guibg=' . s:accent_dim . ' gui=bold cterm=bold'
execute 'hi  WildMenu           guifg=' . s:fg_alt . ' guibg=' . s:accent_dim

" Messages
execute 'hi  ErrorMsg           guifg=' . s:err
execute 'hi  WarningMsg         guifg=' . s:warn
execute 'hi  ModeMsg            guifg=' . s:fg_alt . ' gui=bold cterm=bold'
execute 'hi  MoreMsg            guifg=' . s:accent
execute 'hi  Question           guifg=' . s:accent
execute 'hi  Title              guifg=' . s:keyword . ' gui=bold cterm=bold'
execute 'hi  Directory          guifg=' . s:accent_alt

" Syntax (legacy groups)
execute 'hi  Comment            guifg=' . s:comment
execute 'hi  String             guifg=' . s:string
execute 'hi  Character          guifg=' . s:string
execute 'hi  Number             guifg=' . s:number
execute 'hi  Boolean            guifg=' . s:constant
execute 'hi  Float              guifg=' . s:number

execute 'hi  Identifier         guifg=' . s:variable
execute 'hi  Function           guifg=' . s:func

execute 'hi  Statement          guifg=' . s:keyword
execute 'hi  Conditional        guifg=' . s:preproc
execute 'hi  Repeat             guifg=' . s:preproc
execute 'hi  Label              guifg=' . s:keyword
execute 'hi  Operator           guifg=' . s:operator
execute 'hi  Keyword            guifg=' . s:keyword
execute 'hi  Exception          guifg=' . s:preproc

execute 'hi  PreProc            guifg=' . s:preproc
execute 'hi  Include            guifg=' . s:preproc
execute 'hi  Define             guifg=' . s:preproc
execute 'hi  Macro              guifg=' . s:preproc
execute 'hi  PreCondit          guifg=' . s:preproc

execute 'hi  Type               guifg=' . s:type
execute 'hi  StorageClass       guifg=' . s:keyword
execute 'hi  Structure          guifg=' . s:type
execute 'hi  Typedef            guifg=' . s:type

execute 'hi  Special            guifg=' . s:annotation
execute 'hi  SpecialChar        guifg=' . s:regex
execute 'hi  Tag                guifg=' . s:tag
execute 'hi  Delimiter          guifg=' . s:fg
execute 'hi  SpecialComment     guifg=' . s:comment
execute 'hi  Debug              guifg=' . s:debug

execute 'hi  Underlined gui=underline cterm=underline'
execute 'hi  Error              guifg=' . s:err
execute 'hi  Todo               guifg=' . s:warn . ' gui=bold cterm=bold'

" Treesitter
execute 'hi  link @comment Comment'
execute 'hi  @comment.documentation       guifg=' . s:comment
execute 'hi  link @comment.todo Todo'
execute 'hi  @comment.error               guifg=' . s:err . ' gui=bold cterm=bold'
execute 'hi  @comment.warning             guifg=' . s:warn . ' gui=bold cterm=bold'
execute 'hi  @comment.note                guifg=' . s:info . ' gui=bold cterm=bold'

execute 'hi  link @string String'
execute 'hi  @string.escape               guifg=' . s:keyword
execute 'hi  @string.regexp               guifg=' . s:regex
execute 'hi  @string.special              guifg=' . s:annotation
execute 'hi  link @character Character'
execute 'hi  link @number  Number'
execute 'hi  link @boolean Boolean'
execute 'hi  link @float   Float'

execute 'hi  @constant                    guifg=' . s:constant
execute 'hi  @constant.builtin            guifg=' . s:constant
execute 'hi  @constant.macro              guifg=' . s:preproc

execute 'hi  @variable                    guifg=' . s:variable
execute 'hi  @variable.builtin            guifg=' . s:keyword . ' gui=italic cterm=italic'
execute 'hi  @variable.parameter          guifg=' . s:param
execute 'hi  @variable.member             guifg=' . s:member

execute 'hi  @property                    guifg=' . s:member
execute 'hi  @field                       guifg=' . s:member

execute 'hi  @function                    guifg=' . s:func
execute 'hi  @function.builtin            guifg=' . s:func
execute 'hi  @function.call               guifg=' . s:func
execute 'hi  @function.macro              guifg=' . s:macro
execute 'hi  @function.method             guifg=' . s:func
execute 'hi  @function.method.call        guifg=' . s:func
execute 'hi  @constructor                 guifg=' . s:type

execute 'hi  link @keyword Keyword'
execute 'hi  @keyword.function            guifg=' . s:keyword
execute 'hi  @keyword.return              guifg=' . s:preproc
execute 'hi  @keyword.conditional         guifg=' . s:preproc
execute 'hi  @keyword.repeat              guifg=' . s:preproc
execute 'hi  @keyword.import              guifg=' . s:preproc
execute 'hi  @keyword.exception           guifg=' . s:preproc
execute 'hi  @keyword.operator            guifg=' . s:keyword

execute 'hi  link @operator Operator'

execute 'hi  link @type Type'
execute 'hi  @type.builtin                guifg=' . s:keyword
execute 'hi  @type.definition             guifg=' . s:type
execute 'hi  @type.qualifier              guifg=' . s:keyword

execute 'hi  @attribute                   guifg=' . s:annotation
execute 'hi  @module                      guifg=' . s:module
execute 'hi  @namespace                   guifg=' . s:module

execute 'hi  @punctuation                 guifg=' . s:fg
execute 'hi  @punctuation.bracket         guifg=' . s:fg
execute 'hi  @punctuation.delimiter       guifg=' . s:fg
execute 'hi  @punctuation.special         guifg=' . s:keyword

execute 'hi  @tag                         guifg=' . s:tag
execute 'hi  @tag.builtin                 guifg=' . s:tag
execute 'hi  @tag.attribute               guifg=' . s:attr
execute 'hi  @tag.delimiter               guifg=' . s:fg_dim

execute 'hi  @markup.heading              guifg=' . s:keyword . ' gui=bold cterm=bold'
execute 'hi  @markup.strong               guifg=' . s:fg . ' gui=bold cterm=bold'
execute 'hi  @markup.italic               guifg=' . s:preproc . ' gui=italic cterm=italic'
execute 'hi  @markup.underline          cterm=underline gui=underline'
execute 'hi  @markup.strikethrough      gui=strikethrough gui=strikethrough'
execute 'hi  @markup.link                 guifg=' . s:accent_alt . ' gui=underline cterm=underline'
execute 'hi  @markup.link.label           guifg=' . s:string
execute 'hi  @markup.link.url             guifg=' . s:accent_alt . ' gui=underline cterm=underline'
execute 'hi  @markup.list                 guifg=' . s:keyword
execute 'hi  @markup.quote                guifg=' . s:comment
execute 'hi  @markup.raw                  guifg=' . s:string
execute 'hi  @markup.raw.block            guifg=' . s:fg . ' guibg=' . s:bg_line

" LSP semantic tokens
execute 'hi  link @lsp.type.class     @type'
execute 'hi  link @lsp.type.enum      @type'
execute 'hi  link @lsp.type.interface @type'
execute 'hi  link @lsp.type.struct    @type'
execute 'hi  link @lsp.type.type      @type'
execute 'hi  link @lsp.type.parameter @variable.parameter'
execute 'hi  link @lsp.type.variable  @variable'
execute 'hi  link @lsp.type.property  @property'
execute 'hi  link @lsp.type.function  @function'
execute 'hi  link @lsp.type.method    @function.method'
execute 'hi  link @lsp.type.macro     @function.macro'
execute 'hi  link @lsp.type.namespace @namespace'
execute 'hi  @lsp.type.enumMember         guifg=' . s:constant
execute 'hi  link @lsp.typemod.variable.readonly @constant'
execute 'hi  @lsp.type.const              guifg=' . s:constant
execute 'hi  @lsp.typemod.const.static    guifg=' . s:constant
execute 'hi  @lsp.typemod.const.constant    guifg=' . s:constant
execute 'hi  @lsp.type.const.rust         guifg=' . s:constant
execute 'hi  @lsp.type.macro              guifg=' . s:macro

" Diagnostics
execute 'hi  DiagnosticError              guifg=' . s:err
execute 'hi  DiagnosticWarn               guifg=' . s:warn
execute 'hi  DiagnosticInfo               guifg=' . s:info
execute 'hi  DiagnosticHint               guifg=' . s:hint
execute 'hi  DiagnosticUnderlineError     gui=undercurl cterm=underline guisp=' . s:err
execute 'hi  DiagnosticUnderlineWarn      gui=undercurl cterm=underline guisp=' . s:warn
execute 'hi  DiagnosticUnderlineInfo      gui=undercurl cterm=underline guisp=' . s:info
execute 'hi  DiagnosticUnderlineHint      gui=undercurl cterm=underline guisp=' . s:hint
execute 'hi  DiagnosticVirtualTextError    guifg=' . s:err . ' guibg=' . s:bg
execute 'hi  DiagnosticVirtualTextWarn     guifg=' . s:warn . ' guibg=' . s:bg
execute 'hi  DiagnosticVirtualTextInfo     guifg=' . s:info . ' guibg=' . s:bg
execute 'hi  DiagnosticVirtualTextHint     guifg=' . s:hint . ' guibg=' . s:bg

" Diff / git
execute 'hi  DiffAdd            guibg=' . s:diff_add
execute 'hi  DiffChange         guibg=' . s:diff_chg
execute 'hi  DiffDelete         guifg=' . s:diff_del_fg . ' guibg=' . s:diff_del
execute 'hi  DiffText           guibg=' . s:diff_chg . ' gui=bold cterm=bold'
execute 'hi  GitSignsAdd        guifg=' . s:diff_add_fg
execute 'hi  GitSignsChange     guifg=' . s:warn
execute 'hi  GitSignsDelete     guifg=' . s:diff_del_fg

" Telescope / Snacks picker
execute 'hi  TelescopeBorder            guifg=' . s:border . ' guibg=' . s:bg_menu
execute 'hi  TelescopeNormal            guifg=' . s:fg . ' guibg=' . s:bg_menu
execute 'hi  TelescopeSelection         guifg=' . s:fg_alt . ' guibg=' . s:accent_dim
execute 'hi  TelescopeMatching          guifg=' . s:accent_alt . ' gui=bold cterm=bold'
execute 'hi  TelescopePromptPrefix      guifg=' . s:accent

execute 'hi  SnacksPickerBorder         guifg=' . s:border . ' guibg=' . s:bg_menu
execute 'hi  SnacksPickerNormal         guifg=' . s:fg . ' guibg=' . s:bg_menu
execute 'hi  SnacksPickerListCursorLine    guibg=' . s:accent_dim
execute 'hi  SnacksPickerInputBorder    guifg=' . s:accent_dim . ' guibg=' . s:bg_menu
execute 'hi  SnacksPickerMatch          guifg=' . s:accent_alt . ' gui=bold cterm=bold'

" blink.cmp (vague's missing groups too — keep parity with custom highlights)
execute 'hi  link BlinkCmpMenu Pmenu'
execute 'hi  BlinkCmpMenuBorder             guifg=' . s:border_alt . ' guibg=' . s:bg_menu
execute 'hi  link BlinkCmpMenuSelection PmenuSel'
execute 'hi  link BlinkCmpScrollBarThumb PmenuThumb'
execute 'hi  link BlinkCmpScrollBarGutter PmenuSbar'
execute 'hi  BlinkCmpLabel                  guifg=' . s:fg
execute 'hi  BlinkCmpLabelMatch             guifg=' . s:accent_alt . ' gui=bold cterm=bold'
execute 'hi  BlinkCmpLabelDeprecated        guifg=' . s:fg_muted . ' gui=strikethrough cterm=strikethrough'
execute 'hi  BlinkCmpLabelDetail            guifg=' . s:fg_dim
execute 'hi  BlinkCmpLabelDescription       guifg=' . s:fg_dim
execute 'hi  BlinkCmpSource                 guifg=' . s:fg_dim
execute 'hi  link BlinkCmpDoc NormalFloat'
execute 'hi  BlinkCmpDocBorder              guifg=' . s:border_alt . ' guibg=' . s:bg_menu

" Bufferline (light touch)
execute 'hi  BufferLineFill             guibg=' . s:bg_alt
execute 'hi  BufferLineBackground       guifg=' . s:fg_dim . ' guibg=' . s:bg_alt
execute 'hi  BufferLineBufferSelected   guifg=' . s:fg_alt . ' guibg=' . s:bg . 'gui=bold cterm=bold'
execute 'hi  BufferLineIndicatorSelected    guifg=' . s:accent . ' guibg=' . s:bg

" Notify / which-key
execute 'hi  WhichKey                   guifg=' . s:keyword
execute 'hi  WhichKeyGroup              guifg=' . s:func
execute 'hi  WhichKeyDesc               guifg=' . s:fg
execute 'hi  WhichKeySeparator          guifg=' . s:fg_dim
execute 'hi  WhichKeyFloat              guibg=' . s:bg_menu

" --------------------------------------------------------------------------------------------------
