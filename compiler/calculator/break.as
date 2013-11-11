	push	1
	pop	i
L000:
	push	i
	push	10
	compLT
	jz	L001
	push	i
	push	5
	compGT
	jz	L002
	jmp	L001
L002:
	push	i
	print
	push	i
	push	1
	add
	pop	i
	jmp	L000
L001:
