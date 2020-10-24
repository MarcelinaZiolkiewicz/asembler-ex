section .data
	qNum1 dq 2
	qNum2 dq 4
	qNum3 dq 5
	qNum4 dq 2
	qAmo dq 4

section .bss
	qAns resq 1
	qRes resq 1
	
section .text
	global _start

_start:
	call _add
	call _div

_end:
	mov rax, 60
	mov rdi, 0
	syscall

_add:
	mov rax, qword[qNum1]
	add rax, qword[qNum2]
	add rax, qword[qNum3]
	add rax, qword[qNum4]
	mov qword[qAns], rax
	ret

_div:
	mov rdx, 0
	mov rax, qword[qAns]
	div qword[qAmo]
	mov qword[qRes], rax
	ret
