	push	1
	pop	fp[0]
	isp
	push	2
	pop	fp[1]
	isp
	push	3
	pop	fp[2]
	isp
	push	4
	pop	fp[3]
	isp
	push	5
	pop	fp[4]
	isp
	push	6
	pop	fp[5]
	isp
	push	0
	pop	fp[6]
	isp
	push	0
	pop	fp[7]
	isp
L000:
	push	fp[7]
	push	6
	compLT
	j0	L002
	push	fp[7]
	push 0
	add
	pop in
	push fp[in]
	push	fp[6]
	add
	pop	fp[6]
L001:
	push	fp[7]
	push	1
	add
	pop	fp[7]
	jmp	L000
L002:
	push	fp[6]
	push	6
	div
	puti
