	global  ft_isdigit
	;; extern  puts
	section .text
ft_isdigit:
	;; tests if char is a digit
	;; char
	;;  ->  used : /
	cmp 	di, 0x39
	jg	isdigit_n
	cmp	di, 0x30
	jl	isdigit_n
	mov	rax, 1
	ret
isdigit_n:
	mov	rax, 0
	ret	
