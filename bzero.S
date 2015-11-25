	global  ft_bzero
	;; extern  puts
	section .text
ft_bzero:	
	mov	rcx, rsi ; rsi contains the number of bytes to init, and ecx is the rep counter
	mov	rsi, rdi ; rdi contains a pointer to the block to init
	mov	al, 0    ; al stores what to ini the momory with
	cld		 ; direction flag = forward
	rep stosb 	 ; sets ecx bytes of memory at rsi to 0
	ret
