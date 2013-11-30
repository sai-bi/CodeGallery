	push	1
	push	1
	pop	fp[0]
L000:
	push	fp[0]
	push	8
	compLE
	j0	L002
	push	1
	push	1
	pop	fp[1]
L003:
	push	fp[1]
	push	1
	add
	pop	fp[1]
	push	fp[1]
	puti
	push	fp[1]
	push	fp[0]
	compLE
	j0	L004
	jmp	L003
L004:
L001:
	push	fp[0]
	push	1
	add
	pop	fp[0]
	jmp	L000
L002:
