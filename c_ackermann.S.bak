	global  c_ackermann
	;; extern  puts
	section .text

	;; this is a semi-iterative ackermann
	;; doing a hashtable in asm is a bit too hardcore for me,
	;; plus this piece of code is sexy enough for me to be satisfied

	;; you could make a bit faster by using 32 bits registers instead of 64bits one
	
c_ackermann:
ack_md0:
	cmp rsi, 0
	jne ack_nd0
	mov rsi, 1
	jmp ack_endcond
ack_nd0:
	push rdi
	dec rsi
	call c_ackermann
	pop rdi
	mov rsi, rax
ack_endcond:
	dec rdi

	cmp rdi, 0
	jne ack_md0
	
	mov rax, rsi
	inc rax
	ret
