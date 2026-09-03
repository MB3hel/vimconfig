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
" Generated from hex codes using gencolors.py 
" --------------------------------------------------------------------------------------------------

" Backgrounds (darkest -> lightest)
let s:bg          = { 'guicolor': '#121314',   'term256color': '233', 'term16color': '0'  }
let s:bg_alt      = { 'guicolor': '#191a1b',   'term256color': '234', 'term16color': '0'  }
let s:bg_menu     = { 'guicolor': '#202122',   'term256color': '234', 'term16color': '0'  }
let s:bg_line     = { 'guicolor': '#242526',   'term256color': '235', 'term16color': '0'  }
let s:bg_widget   = { 'guicolor': '#262728',   'term256color': '235', 'term16color': '0'  }
let s:bg_select   = { 'guicolor': '#276782',   'term256color': '24',  'term16color': '6'  }
let s:bg_match    = { 'guicolor': '#27678290', 'term256color': '24',  'term16color': '6'  }
let s:border      = { 'guicolor': '#2a2b2c',   'term256color': '235', 'term16color': '0'  }
let s:border_alt  = { 'guicolor': '#333536',   'term256color': '236', 'term16color': '0'  }

" Foregrounds
let s:fg          = { 'guicolor': '#bbbebf',   'term256color': '250', 'term16color': '7'  }
let s:fg_alt      = { 'guicolor': '#bfbfbf',   'term256color': '7',   'term16color': '7'  }
let s:fg_dim      = { 'guicolor': '#8c8c8c',   'term256color': '245', 'term16color': '8'  }
let s:fg_muted    = { 'guicolor': '#555555',   'term256color': '240', 'term16color': '8'  }
let s:white       = { 'guicolor': '#ffffff',   'term256color': '15',  'term16color': '15' }

" Accent (cyan/blue)
let s:accent      = { 'guicolor': '#3994bc',   'term256color': '67',  'term16color': '6'  }
let s:accent_dim  = { 'guicolor': '#297aa0',   'term256color': '31',  'term16color': '6'  }
let s:accent_alt  = { 'guicolor': '#48a0c7',   'term256color': '74',  'term16color': '8'  }

" Syntax (Dark 2026 / GitHub Dark style — red keywords, purple functions)
let s:comment     = { 'guicolor': '#8B949E',   'term256color': '246', 'term16color': '8'  }
let s:string      = { 'guicolor': '#A5D6FF',   'term256color': '153', 'term16color': '7'  }
let s:regex       = { 'guicolor': '#7EE787',   'term256color': '114', 'term16color': '7'  }
let s:number      = { 'guicolor': '#79C0FF',   'term256color': '111', 'term16color': '7'  }
let s:keyword     = { 'guicolor': '#FF7B72',   'term256color': '209', 'term16color': '7'  }
let s:func        = { 'guicolor': '#D2A8FF',   'term256color': '183', 'term16color': '7'  }
let s:type        = { 'guicolor': '#4EC9B0',   'term256color': '79',  'term16color': '8'  }
let s:variable    = { 'guicolor': '#bbbebf',   'term256color': '250', 'term16color': '7'  }
let s:constant    = { 'guicolor': '#79C0FF',   'term256color': '111', 'term16color': '7'  }
let s:operator    = { 'guicolor': '#FF7B72',   'term256color': '209', 'term16color': '7'  }
let s:preproc     = { 'guicolor': '#FF7B72',   'term256color': '209', 'term16color': '7'  }
let s:annotation  = { 'guicolor': '#FFA657',   'term256color': '215', 'term16color': '11' }
let s:param       = { 'guicolor': '#FFA657',   'term256color': '215', 'term16color': '11' }
let s:member      = { 'guicolor': '#79C0FF',   'term256color': '111', 'term16color': '7'  }
let s:tag         = { 'guicolor': '#7EE787',   'term256color': '114', 'term16color': '7'  }
let s:attr        = { 'guicolor': '#79C0FF',   'term256color': '111', 'term16color': '7'  }
let s:module      = { 'guicolor': '#4EC9B0',   'term256color': '79',  'term16color': '8'  }
let s:macro       = { 'guicolor': '#48a0c7',   'term256color': '74',  'term16color': '8'  }

" Diagnostics / status
let s:err         = { 'guicolor': '#F44747',   'term256color': '203', 'term16color': '9'  }
let s:warn        = { 'guicolor': '#CD9731',   'term256color': '173', 'term16color': '3'  }
let s:info        = { 'guicolor': '#6796E6',   'term256color': '68',  'term16color': '7'  }
let s:hint        = { 'guicolor': '#3a94bc',   'term256color': '67',  'term16color': '6'  }
let s:debug       = { 'guicolor': '#b267e6',   'term256color': '134', 'term16color': '7'  }

" Diff
let s:diff_add    = { 'guicolor': '#1b3a1b',   'term256color': '235', 'term16color': '0'  }
let s:diff_add_fg = { 'guicolor': '#7EE787',   'term256color': '114', 'term16color': '7'  }
let s:diff_del    = { 'guicolor': '#3a1b1b',   'term256color': '235', 'term16color': '0'  }
let s:diff_del_fg = { 'guicolor': '#ffa198',   'term256color': '216', 'term16color': '7'  }
let s:diff_chg    = { 'guicolor': '#2a2a4a',   'term256color': '236', 'term16color': '4'  }

" --------------------------------------------------------------------------------------------------



" --------------------------------------------------------------------------------------------------
" Color scheme settings
" --------------------------------------------------------------------------------------------------

if exists("syntax_on")
    syntax reset
endif
highlight clear
set background=dark
let g:colors_name = "dark2026"

source <script>:h/helper.vim

" Editor / UI
"            Group                  Foreground      Background      Special Color       Style
call s:sethl('Normal',              s:fg,           s:bg,           s:nocolor,          s:normal)
call s:sethl('NormalNC',            s:fg,           s:bg,           s:nocolor,          s:normal)
call s:sethl('NormalFloat',         s:fg,           s:bg_menu,      s:nocolor,          s:normal)
call s:sethl('FloatBorder',         s:border_alt,   s:bg_menu,      s:nocolor,          s:normal)
call s:sethl('FloatTitle',          s:fg_alt,       s:bg_menu,      s:nocolor,          s:bold)
call s:sethl('NonText',             s:fg_muted,     s:nocolor,      s:nocolor,          s:normal)
call s:sethl('EndOfBuffer',         s:bg,           s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Whitespace',          s:fg_muted,     s:nocolor,      s:nocolor,          s:normal)
call s:sethl('SpecialKey',          s:fg_muted,     s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Conceal',             s:fg_dim,       s:nocolor,      s:nocolor,          s:normal)

call s:sethl('Cursor',              s:bg,           s:fg,           s:nocolor,          s:normal)
call s:sethl('CursorLine',          s:nocolor,      s:bg_line,      s:nocolor,          s:normal)
call s:sethl('CursorColumn',        s:nocolor,      s:bg_line,      s:nocolor,          s:normal)
call s:sethl('ColorColumn',         s:nocolor,      s:bg_line,      s:nocolor,          s:normal)

execute 'hi!  LineNr             guifg=' . s:fg_muted
execute 'hi!  CursorLineNr       guifg=' . s:fg_alt . ' gui=bold cterm=bold'
execute 'hi!  SignColumn         guibg=' . s:bg
execute 'hi!  FoldColumn         guifg=' . s:fg_muted . ' guibg=' . s:bg
execute 'hi!  Folded             guifg=' . s:fg_dim . ' guibg=' . s:bg_line

execute 'hi!  Visual             guibg=' . s:bg_select
execute 'hi!  VisualNOS          guibg=' . s:bg_select
execute 'hi!  Search             guifg=' . s:fg . ' guibg=' . s:bg_select
execute 'hi!  IncSearch          guifg=' . s:white . ' guibg=' . s:accent
execute 'hi!  CurSearch          guifg=' . s:white . ' guibg=' . s:accent
execute 'hi!  MatchParen         guifg=' . s:accent_alt . ' gui=bold cterm=bold gui=underline cterm=underline'

execute 'hi!  StatusLine         guifg=' . s:fg_dim . ' guibg=' . s:bg_alt
execute 'hi!  StatusLineNC       guifg=' . s:fg_muted . ' guibg=' . s:bg_alt
execute 'hi!  WinSeparator       guifg=' . s:border . ' guibg=' . s:bg
execute 'hi!  VertSplit          guifg=' . s:border . ' guibg=' . s:bg

execute 'hi!  TabLine            guifg=' . s:fg_dim . ' guibg=' . s:bg_alt
execute 'hi!  TabLineFill        guibg=' . s:bg_alt
execute 'hi!  TabLineSel         guifg=' . s:fg_alt . ' guibg=' . s:bg . ' guisp=' . s:accent . ' gui=underline cterm=underline'

" Popup menus / completion
execute 'hi!  Pmenu              guifg=' . s:fg . ' guibg=' . s:bg_menu
execute 'hi!  PmenuSel           guifg=' . s:fg_alt . ' guibg=' . s:accent_dim
execute 'hi!  PmenuSbar          guibg=' . s:bg_line
execute 'hi!  PmenuThumb         guibg=' . s:fg_muted
execute 'hi!  PmenuKind          guifg=' . s:func . ' guibg=' . s:bg_menu
execute 'hi!  PmenuKindSel       guifg=' . s:func . ' guibg=' . s:accent_dim
execute 'hi!  PmenuExtra         guifg=' . s:fg_dim . ' guibg=' . s:bg_menu
execute 'hi!  PmenuExtraSel      guifg=' . s:fg_alt . ' guibg=' . s:accent_dim
execute 'hi!  PmenuMatch         guifg=' . s:accent_alt . ' gui=bold cterm=bold'
execute 'hi!  PmenuMatchSel      guifg=' . s:accent_alt . ' guibg=' . s:accent_dim . ' gui=bold cterm=bold'
execute 'hi!  WildMenu           guifg=' . s:fg_alt . ' guibg=' . s:accent_dim

" Messages
execute 'hi!  ErrorMsg           guifg=' . s:err
execute 'hi!  WarningMsg         guifg=' . s:warn
execute 'hi!  ModeMsg            guifg=' . s:fg_alt . ' gui=bold cterm=bold'
execute 'hi!  MoreMsg            guifg=' . s:accent
execute 'hi!  Question           guifg=' . s:accent
execute 'hi!  Title              guifg=' . s:keyword . ' gui=bold cterm=bold'
execute 'hi!  Directory          guifg=' . s:accent_alt

" Syntax (legacy groups)
execute 'hi!  Comment            guifg=' . s:comment
execute 'hi!  String             guifg=' . s:string
execute 'hi!  Character          guifg=' . s:string
execute 'hi!  Number             guifg=' . s:number
execute 'hi!  Boolean            guifg=' . s:constant
execute 'hi!  Float              guifg=' . s:number

execute 'hi!  Identifier         guifg=' . s:variable
execute 'hi!  Function           guifg=' . s:func

execute 'hi!  Statement          guifg=' . s:keyword
execute 'hi!  Conditional        guifg=' . s:preproc
execute 'hi!  Repeat             guifg=' . s:preproc
execute 'hi!  Label              guifg=' . s:keyword
execute 'hi!  Operator           guifg=' . s:operator
execute 'hi!  Keyword            guifg=' . s:keyword
execute 'hi!  Exception          guifg=' . s:preproc

execute 'hi!  PreProc            guifg=' . s:preproc
execute 'hi!  Include            guifg=' . s:preproc
execute 'hi!  Define             guifg=' . s:preproc
execute 'hi!  Macro              guifg=' . s:preproc
execute 'hi!  PreCondit          guifg=' . s:preproc

execute 'hi!  Type               guifg=' . s:type
execute 'hi!  StorageClass       guifg=' . s:keyword
execute 'hi!  Structure          guifg=' . s:type
execute 'hi!  Typedef            guifg=' . s:type

execute 'hi!  Special            guifg=' . s:annotation
execute 'hi!  SpecialChar        guifg=' . s:regex
execute 'hi!  Tag                guifg=' . s:tag
execute 'hi!  Delimiter          guifg=' . s:fg
execute 'hi!  SpecialComment     guifg=' . s:comment
execute 'hi!  Debug              guifg=' . s:debug

execute 'hi!  Underlined gui=underline cterm=underline'
execute 'hi!  Error              guifg=' . s:err
execute 'hi!  Todo               guifg=' . s:warn . ' gui=bold cterm=bold'

if has('nvim')
    " Treesitter
    execute 'hi!  link @comment Comment'
    execute 'hi!  @comment.documentation       guifg=' . s:comment
    execute 'hi!  link @comment.todo Todo'
    execute 'hi!  @comment.error               guifg=' . s:err . ' gui=bold cterm=bold'
    execute 'hi!  @comment.warning             guifg=' . s:warn . ' gui=bold cterm=bold'
    execute 'hi!  @comment.note                guifg=' . s:info . ' gui=bold cterm=bold'

    execute 'hi!  link @string String'
    execute 'hi!  @string.escape               guifg=' . s:keyword
    execute 'hi!  @string.regexp               guifg=' . s:regex
    execute 'hi!  @string.special              guifg=' . s:annotation
    execute 'hi!  link @character Character'
    execute 'hi!  link @number  Number'
    execute 'hi!  link @boolean Boolean'
    execute 'hi!  link @float   Float'

    execute 'hi!  @constant                    guifg=' . s:constant
    execute 'hi!  @constant.builtin            guifg=' . s:constant
    execute 'hi!  @constant.macro              guifg=' . s:preproc

    execute 'hi!  @variable                    guifg=' . s:variable
    execute 'hi!  @variable.builtin            guifg=' . s:keyword . ' gui=italic cterm=italic'
    execute 'hi!  @variable.parameter          guifg=' . s:param
    execute 'hi!  @variable.member             guifg=' . s:member

    execute 'hi!  @property                    guifg=' . s:member
    execute 'hi!  @field                       guifg=' . s:member

    execute 'hi!  @function                    guifg=' . s:func
    execute 'hi!  @function.builtin            guifg=' . s:func
    execute 'hi!  @function.call               guifg=' . s:func
    execute 'hi!  @function.macro              guifg=' . s:macro
    execute 'hi!  @function.method             guifg=' . s:func
    execute 'hi!  @function.method.call        guifg=' . s:func
    execute 'hi!  @constructor                 guifg=' . s:type

    execute 'hi!  link @keyword Keyword'
    execute 'hi!  @keyword.function            guifg=' . s:keyword
    execute 'hi!  @keyword.return              guifg=' . s:preproc
    execute 'hi!  @keyword.conditional         guifg=' . s:preproc
    execute 'hi!  @keyword.repeat              guifg=' . s:preproc
    execute 'hi!  @keyword.import              guifg=' . s:preproc
    execute 'hi!  @keyword.exception           guifg=' . s:preproc
    execute 'hi!  @keyword.operator            guifg=' . s:keyword

    execute 'hi!  link @operator Operator'

    execute 'hi!  link @type Type'
    execute 'hi!  @type.builtin                guifg=' . s:keyword
    execute 'hi!  @type.definition             guifg=' . s:type
    execute 'hi!  @type.qualifier              guifg=' . s:keyword

    execute 'hi!  @attribute                   guifg=' . s:annotation
    execute 'hi!  @module                      guifg=' . s:module
    execute 'hi!  @namespace                   guifg=' . s:module

    execute 'hi!  @punctuation                 guifg=' . s:fg
    execute 'hi!  @punctuation.bracket         guifg=' . s:fg
    execute 'hi!  @punctuation.delimiter       guifg=' . s:fg
    execute 'hi!  @punctuation.special         guifg=' . s:keyword

    execute 'hi!  @tag                         guifg=' . s:tag
    execute 'hi!  @tag.builtin                 guifg=' . s:tag
    execute 'hi!  @tag.attribute               guifg=' . s:attr
    execute 'hi!  @tag.delimiter               guifg=' . s:fg_dim

    execute 'hi!  @markup.heading              guifg=' . s:keyword . ' gui=bold cterm=bold'
    execute 'hi!  @markup.strong               guifg=' . s:fg . ' gui=bold cterm=bold'
    execute 'hi!  @markup.italic               guifg=' . s:preproc . ' gui=italic cterm=italic'
    execute 'hi!  @markup.underline          cterm=underline gui=underline'
    execute 'hi!  @markup.strikethrough      gui=strikethrough gui=strikethrough'
    execute 'hi!  @markup.link                 guifg=' . s:accent_alt . ' gui=underline cterm=underline'
    execute 'hi!  @markup.link.label           guifg=' . s:string
    execute 'hi!  @markup.link.url             guifg=' . s:accent_alt . ' gui=underline cterm=underline'
    execute 'hi!  @markup.list                 guifg=' . s:keyword
    execute 'hi!  @markup.quote                guifg=' . s:comment
    execute 'hi!  @markup.raw                  guifg=' . s:string
    execute 'hi!  @markup.raw.block            guifg=' . s:fg . ' guibg=' . s:bg_line

    " LSP semantic tokens
    execute 'hi!  link @lsp.type.class     @type'
    execute 'hi!  link @lsp.type.enum      @type'
    execute 'hi!  link @lsp.type.interface @type'
    execute 'hi!  link @lsp.type.struct    @type'
    execute 'hi!  link @lsp.type.type      @type'
    execute 'hi!  link @lsp.type.parameter @variable.parameter'
    execute 'hi!  link @lsp.type.variable  @variable'
    execute 'hi!  link @lsp.type.property  @property'
    execute 'hi!  link @lsp.type.function  @function'
    execute 'hi!  link @lsp.type.method    @function.method'
    execute 'hi!  link @lsp.type.macro     @function.macro'
    execute 'hi!  link @lsp.type.namespace @namespace'
    execute 'hi!  @lsp.type.enumMember         guifg=' . s:constant
    execute 'hi!  link @lsp.typemod.variable.readonly @constant'
    execute 'hi!  @lsp.type.const              guifg=' . s:constant
    execute 'hi!  @lsp.typemod.const.static    guifg=' . s:constant
    execute 'hi!  @lsp.typemod.const.constant    guifg=' . s:constant
    execute 'hi!  @lsp.type.const.rust         guifg=' . s:constant
    execute 'hi!  @lsp.type.macro              guifg=' . s:macro
endif

" Diagnostics
execute 'hi!  DiagnosticError              guifg=' . s:err
execute 'hi!  DiagnosticWarn               guifg=' . s:warn
execute 'hi!  DiagnosticInfo               guifg=' . s:info
execute 'hi!  DiagnosticHint               guifg=' . s:hint
execute 'hi!  DiagnosticUnderlineError     gui=undercurl cterm=underline guisp=' . s:err
execute 'hi!  DiagnosticUnderlineWarn      gui=undercurl cterm=underline guisp=' . s:warn
execute 'hi!  DiagnosticUnderlineInfo      gui=undercurl cterm=underline guisp=' . s:info
execute 'hi!  DiagnosticUnderlineHint      gui=undercurl cterm=underline guisp=' . s:hint
execute 'hi!  DiagnosticVirtualTextError    guifg=' . s:err . ' guibg=' . s:bg
execute 'hi!  DiagnosticVirtualTextWarn     guifg=' . s:warn . ' guibg=' . s:bg
execute 'hi!  DiagnosticVirtualTextInfo     guifg=' . s:info . ' guibg=' . s:bg
execute 'hi!  DiagnosticVirtualTextHint     guifg=' . s:hint . ' guibg=' . s:bg

" Diff / git
execute 'hi!  DiffAdd            guibg=' . s:diff_add
execute 'hi!  DiffChange         guibg=' . s:diff_chg
execute 'hi!  DiffDelete         guifg=' . s:diff_del_fg . ' guibg=' . s:diff_del
execute 'hi!  DiffText           guibg=' . s:diff_chg . ' gui=bold cterm=bold'
execute 'hi!  GitSignsAdd        guifg=' . s:diff_add_fg
execute 'hi!  GitSignsChange     guifg=' . s:warn
execute 'hi!  GitSignsDelete     guifg=' . s:diff_del_fg

" Telescope / Snacks picker
execute 'hi!  TelescopeBorder            guifg=' . s:border . ' guibg=' . s:bg_menu
execute 'hi!  TelescopeNormal            guifg=' . s:fg . ' guibg=' . s:bg_menu
execute 'hi!  TelescopeSelection         guifg=' . s:fg_alt . ' guibg=' . s:accent_dim
execute 'hi!  TelescopeMatching          guifg=' . s:accent_alt . ' gui=bold cterm=bold'
execute 'hi!  TelescopePromptPrefix      guifg=' . s:accent

execute 'hi!  SnacksPickerBorder         guifg=' . s:border . ' guibg=' . s:bg_menu
execute 'hi!  SnacksPickerNormal         guifg=' . s:fg . ' guibg=' . s:bg_menu
execute 'hi!  SnacksPickerListCursorLine    guibg=' . s:accent_dim
execute 'hi!  SnacksPickerInputBorder    guifg=' . s:accent_dim . ' guibg=' . s:bg_menu
execute 'hi!  SnacksPickerMatch          guifg=' . s:accent_alt . ' gui=bold cterm=bold'

" blink.cmp (vague's missing groups too — keep parity with custom highlights)
execute 'hi!  link BlinkCmpMenu Pmenu'
execute 'hi!  BlinkCmpMenuBorder             guifg=' . s:border_alt . ' guibg=' . s:bg_menu
execute 'hi!  link BlinkCmpMenuSelection PmenuSel'
execute 'hi!  link BlinkCmpScrollBarThumb PmenuThumb'
execute 'hi!  link BlinkCmpScrollBarGutter PmenuSbar'
execute 'hi!  BlinkCmpLabel                  guifg=' . s:fg
execute 'hi!  BlinkCmpLabelMatch             guifg=' . s:accent_alt . ' gui=bold cterm=bold'
execute 'hi!  BlinkCmpLabelDeprecated        guifg=' . s:fg_muted . ' gui=strikethrough cterm=strikethrough'
execute 'hi!  BlinkCmpLabelDetail            guifg=' . s:fg_dim
execute 'hi!  BlinkCmpLabelDescription       guifg=' . s:fg_dim
execute 'hi!  BlinkCmpSource                 guifg=' . s:fg_dim
execute 'hi!  link BlinkCmpDoc NormalFloat'
execute 'hi!  BlinkCmpDocBorder              guifg=' . s:border_alt . ' guibg=' . s:bg_menu

" Bufferline (light touch)
execute 'hi!  BufferLineFill             guibg=' . s:bg_alt
execute 'hi!  BufferLineBackground       guifg=' . s:fg_dim . ' guibg=' . s:bg_alt
execute 'hi!  BufferLineBufferSelected   guifg=' . s:fg_alt . ' guibg=' . s:bg . ' gui=bold cterm=bold'
execute 'hi!  BufferLineIndicatorSelected    guifg=' . s:accent . ' guibg=' . s:bg

" Notify / which-key
execute 'hi!  WhichKey                   guifg=' . s:keyword
execute 'hi!  WhichKeyGroup              guifg=' . s:func
execute 'hi!  WhichKeyDesc               guifg=' . s:fg
execute 'hi!  WhichKeySeparator          guifg=' . s:fg_dim
execute 'hi!  WhichKeyFloat              guibg=' . s:bg_menu

" --------------------------------------------------------------------------------------------------
