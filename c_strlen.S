	global  c_strlen
	;; extern  puts
	section .text
c_strlen:
	;; concatenates 2 strings
	;; *dest, *origin
	;; ->
	mov	r11, rdi
	xor	rcx, rcx
	not	rcx		; set rcx to max value
	mov	al, 0 		; byte to find
	cld
	repne scasb 		; find the first al byte starting from edi (dest string)
	;; at that moment, edi is at the end of the string
	;; esi is the begenning of the string to copy
	mov rax, rcx
	not rax
	dec rax

	ret
