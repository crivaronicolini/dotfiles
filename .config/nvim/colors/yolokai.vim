lua << EOF
--[[ Build using Highlite, a Neovim colorscheme template.
	* Author:     Iron-E (https://github.com/Iron-E)
	* Repository: https://github.com/Iron-E/nvim-highlite

	Rewrite of RNB, a Vim colorsheme template.
	* Author:        Romain Lafourcade (https://github.com/romainl)
	* Canonical URL: https://github.com/romainl/vim-rnb

	Yolokai colorscheme based on monokai/molokai with minor changes
	* Background is completely black. No washed out greyish backgrounds
	* Comment highlight is slightly different
	* Slightly different colors for errors, floating windows, quickfix
	  line selection and such
	* Author: Sanchayan Maity (https://gitlab.com/SanchayanMaity)
]]

vim.g.colors_name = 'yolokai'

local white       = { '#E8E8E3', 252, 'white' }
local white2      = { '#d8d8d3', 250, 'white2' }
local black       = { '#000000', 234, 'black' }
local lightblack  = { '#2D2E27', 235, 'lightblack' }
local lightblack2 = { '#383a3e', 236, 'lightblack2' }
local lightblack3 = { '#3f4145', 237, 'lightblack3' }
local darkblack   = { '#211F1C', 233, 'darkblack' }
local grey        = { '#8F908A', 243, 'grey' }
local lightgrey   = { '#575b61', 237, 'lightgrey' }
local darkgrey    = { '#64645e', 239, 'darkgrey' }
local warmgrey    = { '#A6A185', 59,  'warmgrey' }

local pink        = { '#F92772', 197, 'pink' }
local green       = { '#A6E22D', 148, 'green' }
local darkgreen   = { '#50de60', 83,  'darkgreen' }
local aqua        = { '#66d9ef', 81,  'aqua' }
local yellow      = { '#E6DB74', 186, 'yellow' }
local orange      = { '#FD9720', 208, 'orange' }
local purple      = { '#ae81ff', 141, 'purple' }
local red         = { '#e73c50', 196, 'red' }
local purered     = { '#ff0000', 52,  'purered' }
local darkred     = { '#5f0000', 52,  'darkred' }

--[[ DO NOT EDIT `BG`, `FG`, or `NONE`.
	Feel free to uncomment `BG`. It is not used by default so it is commented out.
]]
local BG   = 'bg'
local FG   = 'fg'
local NONE = 'NONE'

--[[ These are the ones you should edit. ]]
-- This is the only highlight that must be defined separately.
local highlight_group_normal = {bg=black, fg=white, style=NONE}

-- This is where the rest of your highlights should go.
local highlight_groups = {
	--[[ 4.1. Text Analysis ]]
	Comment     = {bg=NONE,        fg=warmgrey,     style='italic'},
	EndOfBuffer = 'NonText',
	NonText     = {bg=NONE,        fg=lightgrey,    style=NONE    },
	Whitespace  = 'NonText',

	--[[ 4.1.1. Literals]]
	Constant  = {bg=NONE,       fg=purple,         style=NONE},
	String    = {bg=NONE,       fg=yellow,         style=NONE},
	Character = {bg=NONE,       fg=yellow,         style=NONE},
	Number    = {bg=NONE,       fg=purple,         style=NONE},
	Boolean   = {bg=NONE,       fg=purple,         style=NONE},
	Float     = 'Number',

	--[[ 4.1.2. Identifiers]]
	Identifier = {bg=NONE, fg=green,     style=NONE},
	Function   = {bg=NONE, fg=green,     style=NONE},

	--[[ 4.1.3. Syntax]]
	Statement   = {bg=NONE,        fg=pink,        style=NONE    },
	Conditional = {bg=NONE,        fg=pink,        style='italic'},
	Repeat      = 'Keyword',
	Label       = {bg=NONE,        fg=pink,        style='italic'},
	Operator    = {bg=NONE,        fg=pink,        style=NONE    },
	Keyword     = {bg=NONE,        fg=pink,        style='bold'  },
	Exception   = {bg=NONE,        fg=red,         style='bold'  },
	Noise       = 'Delimiter',

	--[[ 4.1.4. Metatextual Information]]
	PreProc   = {bg=NONE,      fg=green,        style=NONE       },
	Include   = {bg=NONE,      fg=pink,         style='nocombine'},
	Define    = {bg=NONE,      fg=pink,         style='nocombine'},
	Macro     = {bg=NONE,      fg=orange,       style={'bold', 'nocombine'}},
	PreCondit = {bg=NONE,      fg=green,        style='nocombine'},

	--[[ 4.1.5. Semantics]]
	Type         = {bg=NONE,  fg=aqua,          style=NONE    },
	StorageClass = {bg=NONE,  fg=aqua,          style='bold'  },
	Structure    = {bg=NONE,  fg=aqua,          style='bold'  },
	Typedef      = {bg=NONE,  fg=aqua,          style='italic'},

	--[[ 4.1.6. Edge Cases]]
	Special        = {bg=NONE,           fg=purple,   style=NONE                 },
	SpecialChar    = 'Character' ,
	SpecialKey     = 'Character' ,
	Tag            = 'Underlined',
	Delimiter      = {bg=NONE,           fg=pink,     style=NONE                 },
	-- SpecialComment affects Haskell Language Extension
	SpecialComment = {bg=NONE,           fg=orange,   style={'bold', 'nocombine'}},
	Debug          = 'WarningMsg',

	--[[ 4.1.7. Help Syntax]]
	Underlined        = {bg=NONE,           fg=green,     style='underline'          },
	Ignore            = {bg=NONE,           fg=gray,      style=NONE                 },
	Error             = {bg=black,          fg=red,       style=NONE                 },
	Todo              = {bg=NONE,           fg=orange,    style={'bold', 'underline'}},
	helpHyperTextJump = 'Underlined',
	helpSpecial       = 'Function'  ,
	Hint              = {bg=lightblack3,    fg=white,     style='bold'               },
	Info              = {bg=pink,           fg=black,     style='bold'               },
	Warning           = {bg=orange,         fg=black,     style='bold'               },

	--[[ 4.2... Editor UI  ]]
	--[[ 4.2.1. Status Line]]
	StatusLine       = {bg=black,              fg=warmgrey,     style='inverse'},
	StatusLineNC     = {bg=black,              fg=darkgrey,     style='inverse'},
	StatusLineTerm   = 'StatusLine'  ,
	StatusLineTermNC = 'StatusLineNC',

	--[[ 4.2.2. Separators]]
	VertSplit   = {bg=darkblack,    fg=darkgrey,     style=NONE     },
	TabLine     = {bg=darkblack,    fg=white,        style=NONE     },
	TabLineFill = {bg=NONE,         fg=FG,           style=NONE     },
	TabLineSel  = {bg=darkgrey,     fg=FG,           style='inverse'},
	Title       = {bg=NONE,         fg=NONE,         style='bold'   },

	--[[ 4.2.3. Conditional Line Highlighting]]
	--Conceal={}
	CursorLine      = {bg=lightblack2,     fg=NONE,  style=NONE     },
	CursorLineNr    = {bg=lightblack,      fg=orange,style=NONE     },
	debugBreakpoint = 'ErrorMsg'   ,
	debugPC         = 'ColorColumn',
	LineNr          = {bg=lightblack,      fg=grey,  style=NONE     },
	QuickFixLine    = {bg=darkgrey,        fg=NONE,  style=NONE     },
	Visual          = {bg=NONE,            fg=NONE,  style='inverse'},
	VisualNOS       = {bg=darkgrey,        fg=NONE,  style=NONE     },

	--[[ 4.2.4. Popup Menu]]
	Pmenu      = {bg=black,      fg=aqua,        style=NONE         },
	PmenuSbar  = {bg=black,      fg=NONE,        style=NONE         },
	PmenuSel   = {bg=warmgrey,   fg=white,       style='bold'       },
	PmenuThumb = {bg=grey,       fg=lightblack,  style=NONE         },
	WildMenu   = {bg=NONE,       fg=NONE,        style=NONE         },

	--[[ 4.2.5. Folds]]
	FoldColumn = {bg=darkblack,     fg=NONE,      style='bold'  },
	Folded     = {bg=darkblack,     fg=warmgrey,  style='italic'},

	--[[ 4.2.6. Diffs]]
	DiffAdd    = {bg=NONE,  fg=darkgreen,   style='inverse'},
	DiffChange = {bg=NONE,  fg=yellow,      style='inverse'},
	DiffDelete = {bg=NONE,  fg=red,         style='inverse'},
	DiffText   = {bg=NONE,  fg=NONE,        style='inverse'},

	--[[ 4.2.7. Searching]]
	IncSearch  = {bg=NONE,  fg=NONE,   style='inverse'                 },
	Search     = {bg=yellow,fg=black,  style={'underline', color=white}},
	MatchParen = {bg=NONE,  fg=purple, style={'bold', 'underline'     }},

	--[[ 4.2.8. Spelling]]
	SpellBad   = {bg=NONE,  fg=NONE,  style={'undercurl', color=red   }},
	SpellCap   = {bg=NONE,  fg=NONE,  style={'undercurl', color=purple}},
	SpellLocal = {bg=NONE,  fg=NONE,  style={'undercurl', color=pink  }},
	SpellRare  = {bg=NONE,  fg=NONE,  style={'undercurl', color=aqua  }},

	--[[ 4.2.9. Conditional Column Highlighting]]
	ColorColumn = {bg=lightblack,  fg=NONE,  style=NONE     },
	SignColumn  = {bg=lightblack,  fg=NONE,  style=NONE     },

	--[[ 4.2.10. Messages]]
	ErrorMsg   = {bg=black,  fg=red,          style=NONE       },
	HintMsg    = {bg=black,  fg=purple,       style='bold'     },
	InfoMsg    = {bg=black,  fg=pink,         style='bold'     },
	ModeMsg    = {bg=black,  fg=yellow,       style=NONE       },
	WarningMsg = {bg=black,  fg=red,          style='bold'     },
	Question   = {bg=black,  fg=yellow,       style='underline'},

	--[[ 4.2.11. LSP ]]
	LspDiagnosticsError         = 'Error'   ,
	LspDiagnosticsErrorFloating = 'ErrorMsg',
	LspDiagnosticsErrorSign     = 'ErrorMsg',

	LspDiagnosticsWarning         = 'Warning'   ,
	LspDiagnosticsWarningFloating = 'WarningMsg',
	LspDiagnosticsWarningSign     = 'WarningMsg',

	LspDiagnosticsHint         = 'Hint'   ,
	LspDiagnosticsHintFloating = 'HintMsg',
	LspDiagnosticsHintSign     = 'HintMsg',

	LspDiagnosticsInformation         = 'Info'   ,
	LspDiagnosticsInformationFloating = 'InfoMsg',
	LspDiagnosticsInformationSign     = 'InfoMsg',

	LspDiagnosticsUnderline        = {style={'undercurl', color=white}},
	LspDiagnosticsUnderlineError   = {style={'undercurl', color=red}},
	LspDiagnosticsUnderlineHint    = {style={'undercurl', color=purple}},
	LspDiagnosticsUnderlineInfo    = {style={'undercurl', color=pink}},
	LspDiagnosticsUnderlineWarning = {style={'undercurl', color=red}},

	--[[ 4.2.12. Cursor ]]
	Cursor   = {bg=white,          fg=black, style='inverse'},
	CursorIM = 'Cursor',
	CursorColumn = {bg=lightblack2,fg=NONE,  style=NONE     },

	--[[ 4.2.13. Misc ]]
	Directory     = {bg=NONE,      fg=aqua,  style='bold'},
	Terminal      = 'Normal',
	NormalFloat   = {bg=black,     fg=white, style=NONE  },

	--[[ 4.3. Programming Languages
		Everything in this section is OPTIONAL. Feel free to remove everything
		here if you don't want to define it, or add more if there's something
		missing.
	]]

	--[[ 4.3.1. C ]]
	cConstant    = 'Constant',
	cCustomClass = 'Type'    ,

	--[[ 4.3.2. C++ ]]
	cppSTLexception = 'Exception',
	cppSTLnamespace = 'String'   ,

	--[[ 4.3.3 C# ]]
	csBraces     = 'Delimiter',
	csClass      = 'Structure',
	csClassType  = 'Type',
	csContextualStatement = 'Conditional',
	csEndColon   = 'Delimiter',
	csGeneric    = 'Typedef',
	csInterpolation = 'Include',
	csInterpolationDelimiter = 'SpecialChar',
	csLogicSymbols = 'Operator',
	csModifier   = 'Keyword',
	csNew        = 'Operator',
	csNewType    = 'Type',
	csParens     = 'Delimiter',
	csPreCondit  = 'PreProc',
	csRepeat     = 'Repeat',
	csStorage    = 'StorageClass',
	csUnspecifiedStatement = 'Statement',
	csXmlTag     = 'Define',
	csXmlTagName = 'Define',

	--[[ 4.3.4. CSS ]]
	cssBraces     = 'Delimiter',
	cssProp       = 'Keyword',
	cssSelectorOp = 'Operator',
	cssTagName    = 'Type',
	cssTagName    = 'htmlTagName',
	scssAmpersand = 'Special',
	scssAttribute = 'Normal',
	scssBoolean   = 'Boolean',
	scssDefault   = 'Keyword',
	scssElse      = 'PreCondit',
	scssIf        = 'PreCondit',
	scssInclude   = 'Include',
	scssSelectorChar = 'Operator',
	scssSelectorName = 'Label',
	scssVariable  = 'Define',
	scssVariableAssignment = 'Operator',

	--[[ 4.3.5. Dart ]]
	dartLibrary = 'Statement',

	--[[ 4.3.6. dot ]]
	dotKeyChar = 'Character',
	dotType    = 'Type'     ,

	--[[ 4.3.7. Go ]]
	goBlock                 = 'Delimiter' ,
	goBoolean               = 'Boolean'   ,
	goBuiltins              = 'Operator'  ,
	goField                 = 'Identifier',
	goFloat                 = 'Float'     ,
	goFormatSpecifier       = 'Character' ,
	goFunction              = 'Function'  ,
	goFunctionCall          = 'goFunction',
	goFunctionReturn        = {bg=NONE, fg=NONE, style=NONE},
	goMethodCall            = 'goFunctionCall',
	goParamType             = 'goReceiverType',
	goPointerOperator       = 'SpecialChar'   ,
	goPredefinedIdentifiers = 'Constant'      ,
	goReceiver              = 'goBlock'       ,
	goReceiverType          = 'goTypeName'    ,
	goSimpleParams          = 'goBlock'       ,
	goType                  = 'Type'          ,
	goTypeConstructor       = 'goFunction'    ,
	goTypeName              = 'Type'          ,
	goVarAssign             = 'Identifier'    ,
	goVarDefs               = 'goVarAssign'   ,

	--[[ 4.3.8. HTML ]]
	htmlArg     = 'Label',
	htmlBold    = {bg=NONE, fg=lightgrey, style='bold'},
	htmlTitle   = 'htmlBold',
	htmlEndTag  = 'htmlTag',
	htmlH1      = 'markdownH1',
	htmlH2      = 'markdownH2',
	htmlH3      = 'markdownH3',
	htmlH4      = 'markdownH4',
	htmlH5      = 'markdownH5',
	htmlH6      = 'markdownH6',
	htmlItalic  = {bg=NONE, fg=NONE, style='italic'},
	htmlSpecialTagName = 'Keyword',
	htmlTag     = 'Special',
	htmlTagN    = 'Typedef',
	htmlTagName = 'Type',

	--[[ 4.3.9. Java ]]
	javaClassDecl = 'Structure',

	--[[ 4.3.10. JavaScript ]]
	jsFuncBlock   = 'Function'  ,
	jsObjectKey   = 'Type'      ,
	jsReturn      = 'Keyword'   ,
	jsVariableDef = 'Identifier',

	--[[ 4.3.11. JSON ]]
	jsonBraces = 'luaBraces',
	jsonKeywordMatch = 'Delimiter',
	jsonNull   = 'Constant',
	jsonQuote  = 'String',
	jsonString = 'Normal',
	jsonStringSQError = 'Exception',

	--[[ 4.3.12. Make ]]
	makeCommands   = 'Statment',
	makeSpecTarget = 'Type'    ,

	--[[ 4.3.13. Markdown ]]
	markdownH1          = {bg=NONE,          fg=green_dark,  style='bold'  },
	markdownH2          = {bg=NONE,          fg=red_light,   style='bold'  },
	markdownH3          = {bg=NONE,          fg=green,       style='bold'  },
	markdownH4          = {bg=NONE,          fg=purple,      style='bold'  },
	markdownH5          = {bg=NONE,          fg=orange,      style='bold'  },
	markdownH6          = {bg=NONE,          fg=yellow,      style='bold'  },
	mkdBold             = {bg=NONE,          fg='green',     style='bold'  },
	mkdBold             = 'SpecialComment',
	mkdCode             = 'Statement',
	mkdCodeDelimiter    = 'mkdBold',
	mkdCodeStart        = 'mkdCodeDelimiter',
	mkdCodeEnd          = 'mkdCodeStart',
	mkdHeading          = 'Delimiter',
	mkdItalic           = 'mkdBold',
	mkdListItem         = 'Special',
	mkdRule             = 'Underlined',
	texMathMatcher      = 'Number',
	texMathZoneX        = 'Number',
	texMathZoneY        = 'Number',

	--[[ 4.3.14. Python ]]
	pythonBrackets        = 'Delimiter'       ,
	pythonBuiltinFunc     = 'Operator'        ,
	pythonBuiltinObj      = 'Type'            ,
	pythonBuiltinType     = 'Type'            ,
	pythonClass           = 'Structure'       ,
	pythonClassParameters = 'pythonParameters',
	pythonDecorator       = 'PreProc'         ,
	pythonDottedName      = 'Identifier'      ,
	pythonError           = 'Error'           ,
	pythonException       = 'Exception'       ,
	pythonInclude         = 'Include'         ,
	pythonIndentError     = 'pythonError'     ,
	pythonLambdaExpr      = 'pythonOperator'  ,
	pythonOperator        = 'Operator'        ,
	pythonParam           = 'Identifier'      ,
	pythonParameters      = 'Delimiter'       ,
	pythonSelf            = 'Statement'       ,
	pythonSpaceError      = 'pythonError'     ,
	pythonStatement       = 'Statement'       ,

	--[[ 4.3.15. Ruby ]]
	rubyClass                  = 'Structure',
	rubyDefine                 = 'Define'   ,
	rubyInterpolationDelimiter = 'Delimiter',

	--[[ 4.3.16. Rust ]]
	rustKeyword   = 'Keyword'     ,
	rustModPath   = 'Include'     ,
	rustScopeDecl = 'Delimiter'   ,
	rustTrait     = 'StorageClass',

	--[[ 4.3.17. Scala ]]
	scalaKeyword        = 'Keyword'   ,
	scalaNameDefinition = 'Identifier',

	--[[ 4.3.18. shell ]]
	shDerefSimple = 'SpecialChar',
	shFunctionKey = 'Function',
	shLoop        = 'Repeat',
	shParen       = 'Delimiter',
	shQuote       = 'Delimiter',
	shSet         = 'Statement',
	shTestOpr     = 'Debug',

	--[[ 4.3.19. Solidity ]]
	solBuiltinType  = 'Type'    ,
	solContract     = 'Typedef' ,
	solContractName = 'Function',

	--[[ 4.3.20. TOML ]]
	tomlComment = 'Comment'     ,
	tomlKey     = 'Label'       ,
	tomlTable   = 'StorageClass',

	--[[ 4.3.21. VimScript ]]
	helpSpecial    = 'Special',
	vimFgBgAttrib  = 'Constant',
	vimHiCterm     = 'Label',
	vimHiCtermFgBg = 'vimHiCterm',
	vimHiGroup     = 'Typedef',
	vimHiGui       = 'vimHiCterm',
	vimHiGuiFgBg   = 'vimHiGui',
	vimHiKeyList   = 'Operator',
	vimOption      = 'Define',
	vimSetEqual    = 'Operator',

	--[[ 4.3.22. XML ]]
	xmlAttrib  = 'Label'    ,
	xmlEndTag  = 'Exception',
	xmlEqual   = 'Operator' ,
	xmlTag     = 'Delimiter',
	xmlTagName = 'Define'   ,

	--[[ 4.3.23 Haskell ]]
	haskellType           = 'Type'      ,
	haskellIdentifier     = 'Identifier',
	haskellOperators      = 'Operator'  ,
	haskellWhere          = 'Keyword'   ,
	haskellDelimiter      = 'Delimiter' ,
	haskellImportKeywords = 'Include'   ,
	haskellStatement      = 'Statement' ,

	--[[ 4.3.24 Lua ]]
	luaBraces       = 'Structure',
	luaBrackets     = 'Delimiter',
	luaBuiltin      = 'Keyword',
	luaComma        = 'Delimiter',
	luaFuncCall     = 'Function',
	luaFuncId       = 'luaNoise',
	luaFuncKeyword  = 'Function',
	luaFuncName     = 'Identifier',
	luaFuncParens   = 'Delimiter',
	luaFuncTable    = 'Structure',
	luaLocal        = 'Type',
	luaNoise        = 'Operator',
	luaParens       = 'Delimiter',
	luaSpecialTable = 'Identifier',
	luaSpecialValue = 'Function',

	--[[ 4.3.25. SQL ]]
	sqlKeyword   = 'Keyword',
	sqlParen     = 'Delimiter',
	sqlSpecial   = 'Constant',
	sqlStatement = 'Statement',
	sqlParenFunc = 'Function',

	--[[ 4.3.26. dos INI ]]
	dosiniHeader = 'Title',

	--[[ 4.3.27. Crontab ]]
	crontabDay  = 'StorageClass',
	crontabDow  = 'String',
	crontabHr   = 'Number',
	crontabMin  = 'Float',
	crontabMnth = 'Structure',

	--[[ 4.3.28. PlantUML ]]
	plantumlColonLine = {},

	--[[ 4.4. Plugins
		Everything in this section is OPTIONAL. Feel free to remove everything
		here if you don't want to define it, or add more if there's something
		missing.
	]]
	--[[ 4.4.1. ALE ]]
	ALEErrorSign   = 'ErrorMsg'  ,
	ALEWarningSign = 'WarningMsg',

	--[[ 4.4.2. coc.nvim ]]
	CocErrorHighlight   = {bg=NONE,               fg=NONE,  style={'undercurl', color='red'       }},
	CocErrorSign        = 'ALEErrorSign',
	CocHintHighlight    = {bg=NONE,               fg=NONE,  style={'undercurl', color='purple'    }},
	CocHintSign         = 'HintMsg',
	CocInfoHighlight    = {bg=NONE,               fg=NONE,  style={'undercurl', color='pink'      }},
	CocInfoSign         = 'InfoMsg',
	CocWarningHighlight = {bg=NONE,               fg=NONE,  style={'undercurl', color='orange'    }},
	CocWarningSign      = 'ALEWarningSign',

	--[[ 4.4.2. vim-jumpmotion / vim-easymotion ]]
	EasyMotion = 'IncSearch' ,
	JumpMotion = 'EasyMotion',

	--[[ 4.4.3. vim-markdown ]]
	htmlH1 = 'markdownH1',
	htmlH2 = 'markdownH2',
	htmlH3 = 'markdownH3',
	htmlH4 = 'markdownH4',
	htmlH5 = 'markdownH5',
	htmlH6 = 'markdownH6',

	--[[ 4.4.4. vim-gitgutter / vim-signify ]]
	GitGutterAdd          = {bg=NONE,  fg=green,   style=NONE},
	GitGutterChange       = {bg=NONE,  fg=yellow,  style=NONE},
	GitGutterDelete       = {bg=NONE,  fg=red,     style=NONE},
	GitGutterChangeDelete = {bg=NONE,  fg=orange,  style=NONE},

	SignifySignAdd          = 'GitGutterAdd'         ,
	SignifySignChange       = 'GitGutterChange'      ,
	SignifySignDelete       = 'GitGutterDelete'      ,
	SignifySignChangeDelete = 'GitGutterChangeDelete',

	--[[ 4.4.5. vim-indent-guides ]]
	IndentGuidesOdd  = {bg=darkgrey,   fg=NONE, style=NONE},
	IndentGuidesEven = {bg=grey,       fg=NONE, style=NONE},

	--[[ 4.4.7. NERDTree ]]
	NERDTreeCWD        = 'Label'           ,
	NERDTreeUp         = 'Operator'        ,
	NERDTreeDir        = 'Directory'       ,
	NERDTreeDirSlash   = 'Delimiter'       ,
	NERDTreeOpenable   = 'NERDTreeDir'     ,
	NERDTreeClosable   = 'NERDTreeOpenable',
	NERDTreeExecFile   = 'Function'        ,
	NERDTreeLinkTarget = 'Tag'             ,

	--[[ 4.4.8. nvim-treesitter ]]
	TSError           = 'Error',
	TSPunctDelimiter  = 'Delimiter',
	TSPunctBracket    = 'Delimiter',
	TSPunctSpecial    = 'Special',
	TSConstant        = 'Constant',
	TSConstBuiltin    = 'Type',
	TSConstMacro      = 'Define',
	TSString          = 'String',
	TSStringRegex     = 'String',
	TSStringEscape    = 'SpecialChar',
	TSCharacter       = 'Character',
	TSNumber          = 'Number',
	TSBoolean         = 'Boolean',
	TSFloat           = 'Float',
	TSFunction        = 'Function',
	TSFuncBuiltin     = 'Special',
	TSFuncMacro       = 'Macro',
	TSParameter       = 'Identifier',
	TSParameterReference = 'Type',
	TSMethod          = 'Function',
	TSField           = 'Identifier',
	TSProperty        = 'Identifier',
	TSConstructor     = 'Type',
	TSConditional     = 'Conditional',
	TSRepeat          = 'Repeat',
	TSLabel           = 'Label',
	TSOperator        = 'Operator',
	TSKeyword         = 'Keyword',
	TSKeywordFunction = 'Keyword',
	TSException       = 'Exception',
	TSType            = 'Type',
	TSTypeBuiltin     = 'Type',
	TSStructure       = 'Structure',
	TSInclude         = 'Include',
	TSAnnotation      = 'SpecialChar',
	TSText            = 'String',
	TSStrong          = 'Special',
	TSEmphasis        = 'Underlined',
	TSUnderline       = 'Underlined',
	TSTitle           = 'Comment',
	TSLiteral         = 'Character',
	TSURI             = 'Tag',

	--[[ 4.4.9 SearchLight ]]
	SearchLight = {bg=black, fg=orange, style={'bold', 'italic', 'underline'}},

	--[[ 4.4.10 Sneak ]]
	Sneak      = {bg=purple, fg=black,  style='bold'               },
	SneakScope = {bg=orange, fg=black,  style={'bold', 'underline'}},

	--[[ 4.4.11 Which key ]]
	WhichKey          = 'Function' ,
	WhichKeySeperator = 'DiffAdded',
	WhichKeyGroup     = 'Keyword'  ,
	WhichKeyDesc      = {bg=black,  fg=orange, style=NONE },
	WhichKeyFloating  = 'Pmenu'    ,
}

-- We do not care about terminals which do not support 256 colors
local terminal_ansi_colors = { }

require('yolokai')(
	highlight_group_normal,
	highlight_groups,
	terminal_ansi_colors
)

EOF
