	push	0
	pop	i
L000:
	push	i
	print
	push	i
	push	1
	add
	pop	i
	push	i
	push	10
	compLT
	jz	L001
	jmp	L000
L001:
