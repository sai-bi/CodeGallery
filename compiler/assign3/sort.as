	push	100
	pop	fp[0]
	isp
	push	20
	pop	fp[1]
	isp
	push	90
	pop	fp[2]
	isp
	push	30
	pop	fp[3]
	isp
	push	40
	pop	fp[4]
	isp
	push	9
	pop	fp[5]
	isp
	push	2000
	pop	fp[6]
	isp
	push	50
	pop	fp[7]
	isp
	push	4000
	pop	fp[8]
	isp
	push	111
	pop	fp[9]
	isp
	push	0
	pop	fp[10]
	isp
	push	0
	pop	fp[11]
	isp
L000:
	push	1
	j0	L001
	push	0
	pop	fp[10]
	push	0
	pop	fp[12]
	isp
L002:
	push	fp[12]
	push	9
	compLT
	j0	L004
	push	fp[12]
	push 0
	add
	pop in
	push fp[in]
	push	fp[12]
	push	1
	add
	push 0
	add
	pop in
	push fp[in]
	compGT
	j0	L005
	push	fp[12]
	push 0
	add
	pop in
	push fp[in]
	pop	fp[11]
	push	fp[12]
	push	1
	add
	push 0
	add
	pop in
	push fp[in]
	push 0
	push	fp[12]
	add
	pop in
	pop fp[in]
	push	fp[11]
	push 0
	push	fp[12]
	push	1
	add
	add
	pop in
	pop fp[in]
	push	1
	pop	fp[10]
L005:
L003:
	push	fp[12]
	push	1
	add
	pop	fp[12]
	jmp	L002
L004:
	push	fp[10]
	push	0
	compEQ
	j0	L006
	jmp	L001
L006:
	jmp	L000
L001:
	push	0
	pop	fp[13]
	isp
L007:
	push	fp[13]
	push	10
	compLT
	j0	L009
	push	fp[13]
	push 0
	add
	pop in
	push fp[in]
	puti
L008:
	push	fp[13]
	push	1
	add
	pop	fp[13]
	jmp	L007
L009:
