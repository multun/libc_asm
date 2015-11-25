	global  ft_strcat
	;; extern  puts
	section .text
ft_strcat:
	;; concatenates 2 strings
	;; *dest, *origin
	;; -> 
	xor	rcx, rcx
	not	rcx		; set rcx to max value
	mov	al, 0 		; byte to find
	cld
	repne scasb 		; find the first al byte starting from edi (dest string)
	;; at that moment, edi is at the end of the string
	;; esi is the begenning of the string to copy
strcat_continue:
	movsb 			; moves byte at rsi to rdi
	cmp	byte [esi], 0
	inc	rsi
	inc	rdi
	je	strcat_continue
	ret
