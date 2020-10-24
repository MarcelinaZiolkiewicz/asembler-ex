section .data
	qNum1 dq 22
	qNum2 dq 1
	qNum3 dq 41

section .bss
	qAns1 resq 1

section .text
	global _start


_start: 
	
	
	cmp qNum1, qNum2
	jae





_end: 
	mov rax, 60
	mov rdi, 0
	syscall
