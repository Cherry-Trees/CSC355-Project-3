	section .data
__nls:	db 0xA 			; 0xA = new line
	
	section .text
	global printNL
printNL:
	mov rax, 4 		; write a string
	mov rbx, 1 		; 1 = stdout
	mov rcx, __nls
	mov rdx, 1 		; print 1 character
	int 0x80
	ret
