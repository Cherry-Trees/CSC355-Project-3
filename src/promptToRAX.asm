	section .data
prompt:
	db 	'Enter number: '
charBuffer:
	resb 	21 		; log(2^64 - 1)

	section .text
	global 	promptToRAX

promptToRAX:
	push	rdx
	push	rcx
	push	rbx

	mov 	rax, 4 		; write
	mov 	rbx, 1 		; stdout
	mov 	rcx, prompt  	; where characters start
	mov 	rdx, 14	; 14 characters
	int 	0x80

	mov 	rax, 3 		; read
	mov 	rbx, 0 		; from stdin
	mov 	rcx, charBuffer 	; start of storage
	mov 	rdx, 21 	; no more than 0x64 characters
	int 	0x80

	mov 	rax, 0
	mov	rsi, 0 		; count held on rsi
	mov	rdi, 1		; holding powers of 10 on rdi
	mov	rcx, 0 	 	; actual number on rcx
	mov	rbx, 10 	; rdx just holds 10

pushDigits:
	mov 	al, [charBuffer+rsi]
	sub	rax, 0x30
	push	rax
	inc	rsi
	cmp 	BYTE[charBuffer+rsi], 0xA
	jne	pushDigits

convertToInt:
	pop	rax
	mul	rdi
	add	rcx, rax
	mov	rax, rdi
	mul	rbx
	mov	rdi, rax
	
	dec 	rsi
	cmp	rsi, 0
	jne	convertToInt
	
	mov	rax, rcx 	; rax holds the retval
	pop 	rbx
	pop	rcx
	pop	rdx
	ret
