	global  c_memset
	;; extern  puts
	section .text
c_memset:
	mov	rcx, rdx ; rdx contains the number of bytes to init, and ecx is the rep counter
	mov	al, sil  ; al stores what to ini the momory with
	mov	rsi, rdi ; rdi already contains a pointer to the block to init, saving it
	cld		 ; direction flag = forward
	rep stosb 	 ; sets ecx bytes of memory at rsi to sil
	mov rax, rsi
	ret
