	section .data 
__buffer:	db 0x0 			; 0xA = new line
	
	section .text
	global printDigit
printDigit:

	push 	rax
	push 	rbx
	push	rcx
	push	rdx

	add al, 0x30
	mov [__buffer], al
	
	mov rax, 4 		; write a string
	mov rbx, 1 		; 1 = stdout
	mov rcx, __buffer 	; print the buffer.
	mov rdx, 1 		; print 1 character (single digit)
	int 0x80


	pop 	rax
	pop 	rbx
	pop	rcx
	pop	rdx


	
	ret
