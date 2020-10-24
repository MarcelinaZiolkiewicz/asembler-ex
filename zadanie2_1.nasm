section .data
	qNum1 dq 22
	qNum2 dq 1
	qNum3 dq 41

section .bss
	qAns1 resq 1

section .text
	global _start


_start: 
	
	mov rax, qword[qNum1]
	mov rdx, qword[qNum3]

	checkOne:	
		cmp rax, rdx
		jge ifFir
		jle ifSec
		ret
	ifFir:
		mov qword[qAns1], rax
		call _end

	ifSec:
		mov qword[qAns1], rdx
		call _end
_end: 
	mov rax, 60
	mov rdi, 0
	syscall
