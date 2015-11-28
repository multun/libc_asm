	global  c_memcmp
	;; extern  puts
	section .text
c_memcmp:
	mov rcx, rdx 		; third argument is the length, to be placed in rcx
	cld 			; increasing rdi and rsi
	repe cmpsb
	mov rax, 0
	mov al, [rdi-1]
	mov dl, [rsi-1]
	sub rax, rdx
	ret
