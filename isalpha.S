	global ft_isalpha
	;; extern  puts
	section .text
ft_isalpha:
	;; tests if char is a letter
	;; char
	;;  ->  used : /

	;;  no need to compare 64 bits as arg is a char
	cmp 	di, 0x7a
	jg	isalpha_n
	cmp	di, 0x61
	jl	isalpha_s
	jmp	isalpha_y
isalpha_s:	
	cmp	di, 0x41
	jl	isalpha_n
	cmp	di, 0x5a
	jg	isalpha_n
isalpha_y:
	mov	rax, 1
	ret
isalpha_n:
	mov	rax, 0
	ret
