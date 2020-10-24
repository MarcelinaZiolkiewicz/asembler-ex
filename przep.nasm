section .data
	lpCnt dq 15
	sum dq 0
	

section .text
	global _start

_start:
	mov rax, 1
	mov rcx, qword [lpCnt]

	sumLoop:
		add qword [sum], rax
		add rax, 2
		dec rcx
		cmp rcx, 0
		jne sumLoop


_end:
	mov rax,60
	mov rdi,0 
	syscall
