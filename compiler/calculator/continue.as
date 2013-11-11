	push	4
	pop	i
L000:
	push	i
	print
	push	i
	push	1
	sub
	pop	i
	push	i
	push	1
	compEQ
	jz	L002
	jmp	L001
L002:
	push	1
	jz	L001
	jmp	L000
L001:
