section .data
	lpCnt dq 30
	sum dq 0
	temp dq 1


section .text
	global _start

_start:
	mov ecx, dword[lpCnt]
	mov rbx, 2

	sumLoop:
		mov rdx, 0
		mov rax, qword[temp]
		div rbx
		cmp rdx, 1
		jne skip
		mov rax, qword[temp]
		add qword[sum], rax

	skip:
		inc qword[temp]
		loop sumLoop

_end:
	mov rax, 60
	mov rdi, 0
	syscall
