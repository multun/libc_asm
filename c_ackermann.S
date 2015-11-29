	global  c_ackermann
	;; extern  puts
	section .text

	;; this is a semi-iterative ackermann
	;; doing a hashtable in asm is a bit too hardcore for me,
	;; plus this piece of code is sexy enough for me to be satisfied

	;; you could make a bit faster by using 32 bits registers instead of 64bits one

	;; it's prety fast already because it pushed a single register on each additionnal depth gained

	;; it's actually an asm implementation of this algorith :
	;;  http://en.literateprograms.org/Ackermann_function_%28C%29#Partially_iterative
	;; with optimized stack operations
	
c_ackermann:
	mov rcx,1 		; r11 is the depth counter
c_ackermann_s:
	cmp rsi, 0		; if (n == 0)
	jne ack_nd0		;     goto ack_nd0
	mov rsi, 1		; if (n != 0) { n=1; 
	jmp ack_endcond		; goto endcond; }
ack_nd0:
	push rdi		; pushes m onto the stack
	dec rsi			; n--;
	inc rcx			; increase the depth counter
	jmp c_ackermann_s	; goto the begenning of the loop
ret:				; rsi has changed
	pop rdi			; pop m

ack_endcond:
	dec rdi			; m--

	cmp rdi, 0		; if (n==0)
	jne c_ackermann_s       ;    go to the begenning of the algorithm

	inc rsi			; n++;
	dec rcx			; increase depth counter
	cmp rcx,0		; if depth is 0, stop algo
	je end
	jmp ret			; else, go to previous return point
end:
	mov rax, rsi
	ret
