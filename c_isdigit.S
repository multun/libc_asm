	global  c_isdigit
	;; extern  puts
	section .text
c_isdigit:
	;; tests if char is a digit
	;; char
	;;  ->  used : /
	cmp 	di, 0x39
	jg	isdigit_n
	cmp	di, 0x30
	jl	isdigit_n
	mov	al, 1
	ret
isdigit_n:
	mov	al, 0
	ret	
