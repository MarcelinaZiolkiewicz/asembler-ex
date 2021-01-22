section .data
	array dq 40, 166, 163, 1168, 1036, 1411, 364, 913, 310, 307
	
section .bss
	tabw resq 8
	tabr resq 8

section .text
	global _start

_start:

	mov rcx, 10
	mov rsi, 9

	subEach:
		mov rax, qword [array + rsi * 8]
		sub rax, 10
		mov qword [array + rsi * 8], rax
		push rax
		dec rsi	
		loop subEach
	
		mov rsi, 0
		mov rcx, 10
	mulEach:
		pop rax
		mov rbx, 3
		div rbx
		mov qword [tabr + rsi * 8], rax 
		inc rsi
		loop mulEach
		
		mov rsi, 0
		mov rcx, 10
		mov rbx, 0
	
	lowerThan:
		mov rax, qword [tabr + rsi * 8] 
		cmp rax, 256
		jae skipItem
		push rax
		inc rbx 

	skipItem:
		inc rsi	
		loop lowerThan	
		
		mov rcx, rbx
		mov rsi,0

	addItem:
		pop rax
		mov qword [tabw + rsi * 8], rax
		inc rsi
		loop addItem


_end:
	mov rax, 60
	mov rdi, 0
	syscall
