" Adapted from  https://github.com/D0nw0r/dark2026.nvim/tree/master
" Hybrid of nvim default theme and vscode dark2026
" Only the syntax highlights are applied. Base colors retained from nvim_default
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
"


" --------------------------------------------------------------------------------------------------
" Helper functions (eventually split these out into reuse script)
" --------------------------------------------------------------------------------------------------

" No color
let s:nocolor = { 'guicolor': 'NONE', 'term256color': 'NONE', 'term16color': 'NONE' }

" Style options
let s:normal        = 'gui=NONE           cterm=NONE                term=NONE'
let s:bold          = 'gui=bold           cterm=bold                term=bold'
let s:italic        = 'gui=italic         cterm=italic              term=italic'
let s:underline     = 'gui=underline      cterm=underline           term=underline'
let s:undercurl     = 'gui=undercurl      cterm=underline           term=underline'
let s:strikethrough = 'gui=strikethrough  cterm=strikethrough       term=strikethrough'
let s:boldunderline = 'gui=bold,underline cterm=bold,underline      term=bold,underline'


" Helper function to set highlights fully (have to explicitly set everything we don't want to NONE
" otherwise some vim startup defaults will still apply - hi clear doesn't clear them)
function! s:sethl(group, fg, bg, sp, style)
    " Collect foreground colors
    let l:guifg = get(a:fg, 'guicolor', 'NONE')
    if &t_Co >= 256
        let l:ctermfg = get(a:fg, 'term256color', 'NONE')
    else
        let l:ctermfg = get(a:fg, 'term16color', 'NONE')
    endif

    " Collect background colors
    let l:guibg = get(a:bg, 'guicolor', '#C0C0C0')
    if &t_Co >= 256
        let l:ctermbg = get(a:bg, 'term256color', 'NONE')
    else
        let l:ctermbg = get(a:bg, 'term16color', 'NONE')
    endif

    execute 'hi! ' . a:group . ' guifg=' . l:guifg . ' ctermfg=' . l:ctermfg . ' guibg=' . l:guibg . ' ctermbg=' . l:ctermbg . ' ' . a:style
endfunction

" Set colors, but leave bg unchanged
function! s:sethl_nobg(group, fg, bg, sp, style)
    " Collect foreground colors
    let l:guifg = get(a:fg, 'guicolor', 'NONE')
    if &t_Co >= 256
        let l:ctermfg = get(a:fg, 'term256color', 'NONE')
    else
        let l:ctermfg = get(a:fg, 'term16color', 'NONE')
    endif

    execute 'hi! ' . a:group . ' guifg=' . l:guifg . ' ctermfg=' . l:ctermfg . ' ' . a:style
endfunction

" --------------------------------------------------------------------------------------------------\



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

" Setup
if exists("syntax_on")
    syntax reset
endif
highlight clear
set background=dark
execute 'source' expand('<sfile>:p:h') . '/nvim_default.vim'
let g:colors_name = "dark2026_alt"


" Messages
"            Group                  Foreground      Background      Special Color       Style
call s:sethl('ErrorMsg',            s:err,          s:nocolor,      s:nocolor,          s:normal)
call s:sethl('WarningMsg',          s:warn,         s:nocolor,      s:nocolor,          s:normal)
call s:sethl('ModeMsg',             s:fg_alt,       s:nocolor,      s:nocolor,          s:bold)
call s:sethl('MoreMsg',             s:accent,       s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Question',            s:accent,       s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Title',               s:keyword,      s:nocolor,      s:nocolor,          s:bold)
call s:sethl('Directory',           s:accent_alt,   s:nocolor,      s:nocolor,          s:normal)


" Syntax (legacy groups)
"            Group                  Foreground      Background      Special Color       Style
call s:sethl('Comment',             s:comment,      s:nocolor,      s:nocolor,          s:normal)
call s:sethl('String',              s:string,       s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Character',           s:string,       s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Number',              s:number,       s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Boolean',             s:constant,     s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Float',               s:number,       s:nocolor,      s:nocolor,          s:normal)

call s:sethl('Identifier',          s:variable,     s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Function',            s:func,         s:nocolor,      s:nocolor,          s:normal)

call s:sethl('Statement',           s:keyword,      s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Conditional',         s:preproc,      s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Repeat',              s:preproc,      s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Label',               s:keyword,      s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Operator',            s:operator,     s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Keyword',             s:keyword,      s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Exception',           s:preproc,      s:nocolor,      s:nocolor,          s:normal)

call s:sethl('PreProc',             s:preproc,      s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Include',             s:preproc,      s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Define',              s:preproc,      s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Macro',               s:preproc,      s:nocolor,      s:nocolor,          s:normal)
call s:sethl('PreCondit',           s:preproc,      s:nocolor,      s:nocolor,          s:normal)

call s:sethl('Type',                s:type,         s:nocolor,      s:nocolor,          s:normal)
call s:sethl('StorageClass',        s:keyword,      s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Structure',           s:type,         s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Typedef',             s:type,         s:nocolor,      s:nocolor,          s:normal)

call s:sethl('Special',             s:annotation,   s:nocolor,      s:nocolor,          s:normal)
call s:sethl('SpecialChar',         s:regex,        s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Tag',                 s:tag,          s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Delimiter',           s:fg,           s:nocolor,      s:nocolor,          s:normal)
call s:sethl('SpecialComment',      s:comment,      s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Debug',               s:debug,        s:nocolor,      s:nocolor,          s:normal)

call s:sethl('Underlined',          s:nocolor,      s:nocolor,      s:nocolor,          s:underline)
call s:sethl('Error',               s:err,          s:nocolor,      s:nocolor,          s:normal)
call s:sethl('Todo',                s:warn,         s:nocolor,      s:nocolor,          s:bold)


if has('nvim')
    " Treesitter
    "            Group                          Foreground      Background      Special Color       Style
    call s:sethl('@comment.documentation',      s:comment,      s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@comment.error',              s:err,          s:nocolor,      s:nocolor,          s:bold) 
    call s:sethl('@comment.warning',            s:warn,         s:nocolor,      s:nocolor,          s:bold) 
    call s:sethl('@comment.note',               s:info,         s:nocolor,      s:nocolor,          s:bold) 
    hi! link @comment.todo  Todo
    hi! link @comment       Comment

    call s:sethl('@string.escape',              s:keyword,      s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@string.regex',               s:regex,        s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@string.special',             s:annotation,   s:nocolor,      s:nocolor,          s:normal)
    hi! link @string        String
    hi! link @character     Character
    hi! link @number        Number
    hi! link @boolean       Boolean
    hi! link @float         Float

    call s:sethl('@constant',                   s:constant,     s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@constant.builtin',           s:constant,     s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@constant.macro',             s:preproc,      s:nocolor,      s:nocolor,          s:normal)

    call s:sethl('@variable',                   s:variable,     s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@variable.builtin',           s:keyword,      s:nocolor,      s:nocolor,          s:italic)
    call s:sethl('@variable.parameter',         s:param,        s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@variable.member',            s:member,       s:nocolor,      s:nocolor,          s:normal)

    call s:sethl('@property',                   s:member,       s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@field',                      s:member,       s:nocolor,      s:nocolor,          s:normal)

    call s:sethl('@function',                   s:func,         s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@function.builtin',           s:func,         s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@function.call',              s:func,         s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@function.macro',             s:macro,        s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@function.method',            s:func,         s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@function.method.call',       s:func,         s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@constructor',                s:type,         s:nocolor,      s:nocolor,          s:normal)

    call s:sethl('@keyword.function',           s:keyword,      s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@keyword.return',             s:preproc,      s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@keyword.conditional',        s:preproc,      s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@keyword.repeat',             s:preproc,      s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@keyword.import',             s:preproc,      s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@keyword.exception',          s:preproc,      s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@keyword.operator',           s:keyword,      s:nocolor,      s:nocolor,          s:normal)
    hi! link @keyword       Keyword
    
    hi! link @operator      Operator
    
    call s:sethl('@type.builtin',               s:keyword,      s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@type.definition',            s:type,         s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@type.qualifier',             s:keyword,      s:nocolor,      s:nocolor,          s:normal)
    hi! link @type Type

    call s:sethl('@attribute',                  s:annotation,   s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@module',                     s:module,       s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@namespace',                  s:module,       s:nocolor,      s:nocolor,          s:normal)

    call s:sethl('@punctuation',                s:fg,           s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@punctuation.bracket',        s:fg,           s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@punctuation.delimiter',      s:fg,           s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@punctuation.special',        s:keyword,      s:nocolor,      s:nocolor,          s:normal)

    call s:sethl('@tag',                        s:tag,          s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@tag.builtin',                s:tag,          s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@tag.attribute',              s:attr,         s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@tag.delimiter',              s:fg_dim,       s:nocolor,      s:nocolor,          s:normal)

    call s:sethl('@markup.heading',             s:keyword,      s:nocolor,      s:nocolor,          s:bold)
    call s:sethl('@markup.strong',              s:fg,           s:nocolor,      s:nocolor,          s:bold)
    call s:sethl('@markup.italic',              s:preproc,      s:nocolor,      s:nocolor,          s:italic)
    call s:sethl('@markup.underline',           s:nocolor,      s:nocolor,      s:nocolor,          s:underline)
    call s:sethl('@markup.strikethrough',       s:nocolor,      s:nocolor,      s:nocolor,          s:strikethrough)
    call s:sethl('@markup.link',                s:accent_alt,   s:nocolor,      s:nocolor,          s:underline)
    call s:sethl('@markup.link.label',          s:string,       s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@markup.link.url',            s:accent_alt,   s:nocolor,      s:nocolor,          s:underline)
    call s:sethl('@markup.list',                s:keyword,      s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@markup.quote',               s:comment,      s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@markup.raw',                 s:string,       s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@markup.raw.block',           s:accent_alt,   s:nocolor,      s:nocolor,          s:normal)

    " LSP semantic tokens
    call s:sethl('@lsp.type.enumMember',        s:constant,     s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@lsp.type.const',             s:constant,     s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@lsp.typemod.const.static',   s:constant,     s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@lsp.typemod.const.constant', s:constant,     s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@lsp.type.const.rust',        s:constant,     s:nocolor,      s:nocolor,          s:normal)
    call s:sethl('@lsp.type.macro',             s:macro,        s:nocolor,      s:nocolor,          s:normal)
    hi! link @lsp.type.class                    @type
    hi! link @lsp.type.enum                     @type
    hi! link @lsp.type.interface                @type
    hi! link @lsp.type.struct                   @type
    hi! link @lsp.type.type                     @type
    hi! link @lsp.type.parameter                @variable.parameter
    hi! link @lsp.type.variable                 @variable
    hi! link @lsp.type.property                 @property
    hi! link @lsp.type.function                 @function
    hi! link @lsp.type.method                   @function.method
    hi! link @lsp.type.macro                    @function.macro
    hi! link @lsp.type.namespace                @namespace
    hi! link @lsp.typemod.variable.readonly     @constant
endif


" Diagnostics
"            Group                          Foreground      Background      Special Color       Style
call s:sethl('DiagnosticError',             s:err,          s:nocolor,      s:nocolor,          s:normal)
call s:sethl('DiagnosticWarn',              s:warn,         s:nocolor,      s:nocolor,          s:normal)
call s:sethl('DiagnosticInfo',              s:info,         s:nocolor,      s:nocolor,          s:normal)
call s:sethl('DiagnosticHint',              s:hint,         s:nocolor,      s:nocolor,          s:normal)
call s:sethl('DiagnosticUnderlineError',    s:nocolor,      s:nocolor,      s:err,              s:undercurl)
call s:sethl('DiagnosticUnderlineWarn',     s:nocolor,      s:nocolor,      s:warn,             s:undercurl)
call s:sethl('DiagnosticUnderlineInfo',     s:nocolor,      s:nocolor,      s:info,             s:undercurl)
call s:sethl('DiagnosticUnderlineHint',     s:nocolor,      s:nocolor,      s:hint,             s:undercurl)

call s:sethl_nobg('DiagnosticVirtualTextError',  s:err,          s:bg,           s:nocolor,          s:normal)
call s:sethl_nobg('DiagnosticVirtualTextWarn',   s:warn,         s:bg,           s:nocolor,          s:normal)
call s:sethl_nobg('DiagnosticVirtualTextInfo',   s:info,         s:bg,           s:nocolor,          s:normal)
call s:sethl_nobg('DiagnosticVirtualTextHint',   s:hint,         s:bg,           s:nocolor,          s:normal)


" Diff / git
"            Group                          Foreground      Background      Special Color       Style
call s:sethl('DiffAdd',                     s:nocolor,      s:diff_add,     s:nocolor,          s:normal)
call s:sethl('DiffChange',                  s:nocolor,      s:diff_chg,     s:nocolor,          s:normal)
call s:sethl('DiffDelete',                  s:diff_del_fg,  s:diff_del,     s:nocolor,          s:normal)
call s:sethl('DiffAdd',                     s:nocolor,      s:diff_add,     s:nocolor,          s:normal)
call s:sethl('DiffText',                    s:nocolor,      s:diff_chg,     s:nocolor,          s:bold)
call s:sethl('GitSignsAdd',                 s:diff_add_fg,  s:nocolor,      s:nocolor,          s:normal)
call s:sethl('GitSignsChange',              s:warn,         s:nocolor,      s:nocolor,          s:normal)
call s:sethl('GitSignsDelete',              s:diff_del_fg,  s:nocolor,      s:nocolor,          s:normal)

" --------------------------------------------------------------------------------------------------
