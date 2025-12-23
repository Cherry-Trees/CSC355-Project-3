				; Jamie Miles
				; 12/2/2024
	

	section .data
seg1:	db	'The GCD of '
seg2:	db	' and '
seg3:	db	' is '

	section	.text
	global	_start
	extern	printNL
	extern	printRAX
	extern 	promptToRAX
	extern	GCD


_start:
	
	call	promptToRAX 	; prompt for first number
	push	rax

	call 	promptToRAX 	; prompt for second number
	push	rax

	mov 	rax, 4 		; write seg1
	mov 	rbx, 1 		
	mov 	rcx, seg1 	
	mov 	rdx, 11 	
	int 	0x80

	pop 	rax 		; write first number
	call	printRAX
	push	rax

	mov 	rax, 4 		; write seg2
	mov 	rbx, 1 		
	mov 	rcx, seg2 	
	mov 	rdx, 5	 	
	int 	0x80

	pop	rbx 		; write second number
	pop	rax
	call	printRAX
	push	rax
	push	rbx

	mov 	rax, 4 		; write seg3
	mov 	rbx, 1 		
	mov 	rcx, seg3 	
	mov 	rdx, 4	 	
	int 	0x80

	pop	rbx 		; store the two numbers in rbx and rcx
	pop	rcx

	call 	GCD 		; find the gcd of rbx and rcx, store in rax
	call	printRAX 	; print the answer
	call	printNL

	mov rax, 1
	mov rbx, 0
	int 0x80

