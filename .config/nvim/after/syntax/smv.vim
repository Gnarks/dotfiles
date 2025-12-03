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


syn keyword KeyWords VAR IVAR MODULE



hi def link KeyWords Define


