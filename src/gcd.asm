	section	.text
	global	GCD
	; GCD of rbx and rcx, stores the answer in rax
GCD:	
	cmp	rcx, 0
	je	base

	cmp	rbx, rcx
	jl	flip
	
	jmp	mod

base:
	mov 	rax, rbx
	ret

flip:
	push	rbx
	mov	rbx, rcx
	pop	rcx
	jmp	GCD

mod:
	mov	rdx, 0
	mov	rax, rbx
	div	rcx
	mov	rbx, rdx
	jmp	GCD
	
