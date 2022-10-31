" Vim syntax file
" Language: Shark
" Maintainer: leslie255
" Latest Revision: 2022-10-22

if exists("b:current_syntax")
  finish
endif

syn case match
syn keyword sharkKeyword alias allow break case continue copy else enum extern for if import in local loop return static switch typedef while
syn keyword sharkBool true false
syn keyword sharkPreProc elif else end endif ifpin include macro pin asm
syn keyword sharkTypeNames u8 u16 u32 u64 i8 i16 i32 i64 usize isize f32 f64 none

""" Stolen from C
syn case ignore
syn match	sharkNumbers	display transparent "\<\d\|\.\d" contains=sharkNumber,sharkFloat,sharkOctalError,sharkOctal
" Same, but without octal error (for comments)
syn match	sharkNumbersCom	display contained transparent "\<\d\|\.\d" contains=sharkNumber,sharkFloat,sharkOctal
syn match	sharkNumber		display contained "\d\+\%(u\=l\{0,2}\|ll\=u\)\>"
"hex number
syn match	sharkNumber		display contained "0x\x\+\%(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
syn match	sharkOctal		display contained "0\o\+\%(u\=l\{0,2}\|ll\=u\)\>" contains=sharkOctalZero
syn match	sharkOctalZero	display contained "\<0"
"floating point number, with dot, optional exponent
syn match	sharkFloat		display contained "\d\+\.\d*\%(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match	sharkFloat		display contained "\.\d\+\%(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	sharkFloat		display contained "\d\+e[-+]\=\d\+[fl]\=\>"

" A comment can contain cString, cCharacter and cNumber.
" But a "*/" inside a cString in a cComment DOES end the comment!  So we
" need to use a special type of cString: cCommentString, which also ends on
" "*/", and sees a "*" at the start of the line as comment again.
" Unfortunately this doesn't very well work for // type of comments :-(
syn match	sharkCommentSkip	contained "^\s*\*\%($\|\s\+\)"
syn region  sharkCommentString	contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end=+\*/+me=s-1 contains=sharkSpecial
syn region  sharkComment2String	contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end="$" contains=cSpecial
syn region  sharkCommentL	start="//" skip="\\$" end="$" keepend contains=sharkComment2String,sharkCharacter,sharkNumbersCom
" Use "extend" here to have preprocessor lines not terminate halfway a
" comment.
syn region  sharkComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=sharkCommentString,sharkCharacter,sharkNumbersComSpell extend
" keep a // comment separately, it terminates a preproc. conditional
syn match	sharkCommentError	display "\*/"
syn match	sharkCommentStartError display "/\*"me=e-1 contained
syn match	sharkWrongComTail	display "\*/"

" String and Character constants
" Highlight special characters (those which have a backslash) differently
syn match	sharkSpecial	display contained "\\\%(x\x\+\|\o\{1,3}\|.\|$\)"
syn region	sharkString		start=+\%(L\|u\|u8\|U\|R\|LR\|u8R\|uR\|UR\)\="+ skip=+\\\\\|\\"+ end=+"+ contains=cSpecial extend
syn match	sharkCharacter	"L\='[^\\]'"
syn match	sharkCharacter	"L'[^']*'" contains=sharkSpecial

let b:current_syntax = "shark"
hi def link sharkKeyword            Statement
hi def link sharkPreProc            PreProc
hi def link sharkPreProc            Boolean
hi def link sharkTypeNames          Type
hi def link	sharkNumbers	        Number
hi def link	sharkNumbersCom	        Number
hi def link	sharkNumber		        Number
hi def link	sharkNumber		        Number
hi def link	sharkOctal		        Number
hi def link	sharkOctalZero	        Number
hi def link	sharkFloat		        Number
hi def link	sharkFloat		        Number
hi def link	sharkFloat		        Number
hi def link sharkCommentSkip        Comment
hi def link sharkCommentString      Comment
hi def link sharkComment2String     Comment
hi def link sharkCommentL           Comment
hi def link sharkComment            Comment
hi def link sharkCommentError       Comment
hi def link sharkCommentStartError  Comment
hi def link sharkWrongComTail       Comment
hi def link sharkString             String
hi def link sharkCharacter          Character
