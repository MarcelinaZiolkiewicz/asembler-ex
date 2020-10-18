section .data
	qNum1 dq 720
	qNum2 dq 230

section .bss
	qAns reso

section .text
	global _start

_start:
	call _mul

_end:
	mov rax, 60
	mov rdi, 0
	syscall

_mul:
	mov rax, qword [qNum1]
	mul qword [qNum2] ; => rdx:rax
	mov qword [qAns], rax
	mov qword [qAns + 8], rdx
	ret

