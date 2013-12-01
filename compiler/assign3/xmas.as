	push	1
	pop	fp[0]
	isp
L000:
	push	fp[0]
	push	8
	compLE
	j0	L002
	push	0
	pop	fp[1]
	isp
	push	1
	pop	fp[2]
	isp
L003:
	push	fp[2]
	push	fp[0]
	compLE
	j0	L005
	push	fp[1]
	push	10
	mul
	push	1
	add
	pop	fp[1]
	push	fp[2]
	push	2
	div
	push	2
	mul
	push	fp[2]
	sub
	push	0
	compEQ
	j0	L006
	jmp	L004
L006:
	push	fp[1]
	puti
L004:
	push	fp[2]
	push	1
	add
	pop	fp[2]
	jmp	L003
L005:
L001:
	push	fp[0]
	push	1
	add
	pop	fp[0]
	jmp	L000
L002:
	push	fp[0]
	push	2
	div
	pop	fp[0]
L007:
	push	88
	puti
	push	fp[0]
	push	1
	sub
	pop	fp[0]
	push	fp[0]
	push	1
	compEQ
	j0	L009
	jmp	L008
L009:
	push	1
	j0	L008
	jmp	L007
L008:
