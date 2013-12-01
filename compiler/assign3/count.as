	push	4
	pop	fp[0]
	isp
	push	1
	pop	fp[1]
	isp
	push	5
	pop	fp[2]
	isp
	push	1
	pop	fp[3]
	isp
	push	3
	pop	fp[4]
	isp
	push	1
	pop	fp[5]
	isp
	push	3
	pop	fp[6]
	isp
	push	5
	pop	fp[7]
	isp
	push	1
	pop	fp[8]
	isp
	push	4
	pop	fp[9]
	isp
	push	3
	pop	fp[10]
	isp
	push	1
	pop	fp[11]
	isp
	push	4
	pop	fp[12]
	isp
	push	2
	pop	fp[13]
	isp
	push	2
	pop	fp[14]
	isp
	push	1
	pop	fp[15]
	isp
	push	4
	pop	fp[16]
	isp
	push	4
	pop	fp[17]
	isp
	push	5
	pop	fp[18]
	isp
	push	2
	pop	fp[19]
	isp
	push	0
	pop	fp[20]
	isp
	push	0
	pop	fp[21]
	isp
	push	0
	pop	fp[22]
	isp
	push	0
	pop	fp[23]
	isp
	push	0
	pop	fp[24]
	isp
	push	0
	pop	fp[25]
	isp
L000:
	push	fp[25]
	push	20
	compLT
	j0	L001
	push	fp[25]
	push 0
	add
	pop in
	push fp[in]
	push	1
	sub
	push 20
	add
	pop in
	push fp[in]
	push	1
	add
	push 20
	push	fp[25]
	push 0
	add
	pop in
	push fp[in]
	push	1
	sub
	add
	pop in
	pop fp[in]
	push	fp[25]
	push	1
	add
	pop	fp[25]
	jmp	L000
L001:
	push	0
	pop	fp[25]
L002:
	push	fp[25]
	push 20
	add
	pop in
	push fp[in]
	puti
	push	fp[25]
	push	1
	add
	pop	fp[25]
	push	fp[25]
	push	5
	compLT
	j0	L003
	jmp	L002
L003:
