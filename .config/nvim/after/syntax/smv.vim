" Vim syntax file
" Language:		GNU Assembler
" Maintainer:		Doug Kearns dougkearns@gmail.com
" Previous Maintainers: Erik Wognsen <erik.wognsen@gmail.com>
"			Kevin Dahlhausen <kdahlhaus@yahoo.com>
" Contributors:		Ori Avtalion, Lakshay Garg, Nir Lichtman
" Last Change:		2025 Jan 26

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim


syn keyword KeyWords VAR IVAR MODULE ASSIGN TRANS LTLSPEC CTLSPEC
syn keyword BOOL TRUE FALSE
syn keyword Func next init
syn keyword Cond case esac


syn match   Number	"\<0[oO]\%(_\=\o\)\+\>"
syn match   Assignment "\(:=\|:\)" 
syn match   Comment	"--.*$"
syn match   Indentifier	"\<[a-zA-Z][0-9_a-zA-Z]*\>"
syn match   par	"(\|)\|{\|}"


hi def link KeyWords Define
hi def link Number Number
hi def link BOOL Constant
hi def link Assignment Statement
hi def link Func Function
hi def link Indentifier Identifier
hi def link par Label
hi def link Cond Conditional



