	section .data
__negsign:	db	'-'
	section .text
	extern printDigit
	global printRAX
printRAX:

	push 	rax
	push 	rbx
	push	rcx
	push	rdx

	cmp	rax, 0 
	jge	printPos 	; if the number is negative, flip it and print a negative sign.

	push	rax
	mov	rax, 4
	mov	rbx, 1
	mov	rcx, __negsign
	mov 	rdx, 1
	int	0x80

	pop	rax
	neg	rax
	
	
printPos:	
	mov 	rsi, 0 		; Keep a counter of how many digits there are.

loopDigit:
	inc	rsi		; We've done one digit now.
	
	mov	rbx, 10 	; We're dividing by 10 each time.
	mov	rdx, 0		; div does rdx:rax /= <number>, so clear rdx first
	div	rbx 		; divide rax by 10 ... remainder is in rdx

	mov	rcx, rax 	; save the value of rax before we move the remainder into it.
	mov	al, dl 		; put right-most 8 bits of rdx in al (our remainder), so put dl in al.
	
	push	rax 		; Since we have to print the digits backwards, push the digit to the stack
	mov	rax, rcx
	

	cmp	rcx, 0
	jne	loopDigit

nextDigit:
	dec	rsi
	pop	rax
	call	printDigit
	cmp	rsi, 0
	jne	nextDigit


	pop 	rdx
	pop 	rcx
	pop	rbx
	pop	rax
	
	ret
