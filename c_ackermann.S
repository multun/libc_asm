	global  c_ackermann
	;; extern  puts
	section .text

	;; this is a semi-iterative ackermann, or even iterative if you take in account the fact I added a counter not to use calls

	;; you could make a bit faster by using 32 bits registers instead of 64bits one

	;; it's prety fast already because it pushes a single register on each additionnal depth gained

	;; it's actually an asm implementation of this algorith :
	;;  http://en.literateprograms.org/Ackermann_function_%28C%29#Partially_iterative
	
	;; with optimized stack operations

	;; here are some benchmarks for ackermann(4,1), compiled with gcc without options:

	;; A naive implementation of ackermann gives that result :
	;; ± >$ time ./ackermanntest 

	;; real	0m18.077s
	;; user	0m18.084s
	;; sys	0m0.000s

	
	;; A semi-iterative copied from there http://en.literateprograms.org/Ackermann_function_%28C%29#Partially_iterative gives :
	;; ± >$ time ./ackermanntest2

	;; real	0m5.622s
	;; user	0m5.624s
	;; sys	0m0.000s

	;; however, when compiled with -O3, dark magic happends and it goes down to 1.45 seconds. which beats my algorithm.. I feel like it creates another path for the part just after the c_ackermann_s label.

	;; my implementation gives :
	;; ± >$ time ./c_ackermann.tbin

	;; real	0m1.625s
	;; user	0m1.624s
	;; sys	0m0.000s
c_ackermann:
	mov rcx,1 		; rcx is the depth counter
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

	;; lets conclude:
	;;  don't try to optimize an algorithm yourself
	;; unless you wan't to use a specific instrution set
	;; or you're an expert at it. An hardcode expert.
	;; And I'm not :'(
