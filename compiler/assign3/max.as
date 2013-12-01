	push	0
	pop	fp[0]
	isp
	push	0
	pop	fp[1]
	isp
	push	0
	pop	fp[2]
	isp
	push	0
	pop	fp[3]
	isp
	push	0
	pop	fp[4]
	isp
	push 0
	push	0
	add
	pop in	geti
	pop fp[in]
	push 0
	push	1
	add
	pop in	geti
	pop fp[in]
	push 0
	push	2
	add
	pop in	geti
	pop fp[in]
	push 0
	push	3
	add
	pop in	geti
	pop fp[in]
	push 0
	push	4
	add
	pop in	geti
	pop fp[in]
	push	1
	neg
	pop	fp[5]
	isp
	push	0
	pop	fp[6]
	isp
L000:
	push	fp[6]
	push	5
	compLT
	j0	L002
	push	fp[6]
	push 0
	add
	pop in
	push fp[in]
	push	fp[5]
	compGT
	j0	L003
	push	fp[6]
	push 0
	add
	pop in
	push fp[in]
	pop	fp[5]
L003:
L001:
	push	fp[6]
	push	1
	add
	pop	fp[6]
	jmp	L000
L002:
	push	fp[5]
	puti
