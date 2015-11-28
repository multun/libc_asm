	global  c_puts
	;; extern  puts
	section .text
c_puts:
	push rbx 		; rbw must be preserved accross function calls
	mov rsi, rdi		; save string pointer
	
	mov rbx, rdi
	xor rcx, rcx
	not rcx		; set rcx to max value
	mov al, 0 		; byte to find
	cld
	repne scasb 		; find the first al byte starting from edi (dest string)
	
	;; string pointer
	mov ecx, esi
	;; compute string length
	mov edx, edi
	sub edx, esi
	sub edx, 1
	;; call the write syscall
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov edx, 1
	mov ecx, crt
	mov ebx, 1
	mov eax, 4
	int 0x80
	
	pop rbx
	ret

	section .data
	crt db 0x0a
