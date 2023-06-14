syn match myTodo "\<TODO\>"
hi def link myTodo Todo
hi Todo guifg=Orange guibg=None

syn match myRef "\<REF\>"
hi def link myRef Ref
hi Ref guifg=Blue guibg=None

syn match myCita "\<CITA\>"
hi def link myCita Cita
hi Cita guifg=DarkCyan guibg=None

syn match myFig "\<FIG\>"
hi def link myFig Fig
hi Fig guifg=Brown guibg=None

syn match myTabla "\<TABLA\>"
hi def link myTabla Tabla
hi Tabla guifg=LightRed guibg=None

syn match myEscribir "\<ESCRIBIR\>"
hi def link myEscribir Escribir
hi Escribir guifg=LightMagenta guibg=None

if &background=='dark'
    hi Conceal guifg=white guibg=None
else
    hi Conceal guifg=black guibg=None
endif
hi! def link Title Label

if &background=='dark'
    hi Conceal guifg=white guibg=None
else
    hi Conceal guifg=black guibg=None
endif
hi! def link Title Label



syn match texMathSymbol '\\hat{x}' contained conceal cchar=x̂
syn match texMathSymbol '\\hat{z}' contained conceal cchar=ẑ
syn match texMathSymbol '\\hat{k}' contained conceal cchar=k̂
syn match texMathSymbol '\\hat{j}' contained conceal cchar=ĵ

syn match texMathSymbol '\\vec{a}' contained conceal cchar=ā
syn match texMathSymbol '\\vec{b}' contained conceal cchar=b̄
syn match texMathSymbol '\\vec{c}' contained conceal cchar=c̄
syn match texMathSymbol '\\vec{d}' contained conceal cchar=d̄
syn match texMathSymbol '\\vec{e}' contained conceal cchar=ē
" syn match texMathSymbol '\\vec{f}' contained conceal cchar=f̄
syn match texMathSymbol '\\vec{g}' contained conceal cchar=ḡ
" syn match texMathSymbol '\\vec{h}' contained conceal cchar=h̄
syn match texMathSymbol '\\vec{j}' contained conceal cchar=j̄
syn match texMathSymbol '\\vec{i}' contained conceal cchar=ī
syn match texMathSymbol '\\vec{k}' contained conceal cchar=k̄
syn match texMathSymbol '\\vec{l}' contained conceal cchar=l̄
syn match texMathSymbol '\\vec{m}' contained conceal cchar=m̄
syn match texMathSymbol '\\vec{n}' contained conceal cchar=n̄
syn match texMathSymbol '\\vec{o}' contained conceal cchar=ō
syn match texMathSymbol '\\vec{p}' contained conceal cchar=p̄
syn match texMathSymbol '\\vec{q}' contained conceal cchar=q̄
syn match texMathSymbol '\\vec{r}' contained conceal cchar=r̄
syn match texMathSymbol '\\vec{s}' contained conceal cchar=s̄
syn match texMathSymbol '\\vec{t}' contained conceal cchar=t̄
syn match texMathSymbol '\\vec{u}' contained conceal cchar=ū
syn match texMathSymbol '\\vec{v}' contained conceal cchar=v̄
syn match texMathSymbol '\\vec{w}' contained conceal cchar=w̄
syn match texMathSymbol '\\vec{x}' contained conceal cchar=x̄
syn match texMathSymbol '\\vec{y}' contained conceal cchar=ȳ
syn match texMathSymbol '\\vec{z}' contained conceal cchar=z̄

