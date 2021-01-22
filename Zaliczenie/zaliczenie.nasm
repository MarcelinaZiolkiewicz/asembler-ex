section .data
	tab1 dq 40, 166, 163, 1168, 1036, 1411, 364, 913, 310, 307
	fileName db "zaliczenie.txt"
	
section .bss
	tabw resb 6
	tabr resq 8
	fdOut resb 1

section .text
	global _start

_start:

	mov rcx, 10
	mov rsi, 9

	subEach:
		mov rax, qword [tab1 + rsi * 8]
		sub rax, 10
		mov qword [tab1 + rsi * 8], rax
		push rax
		dec rsi	
		loop subEach
	
		mov rsi, 0
		mov rcx, 10
	divEach:
		pop rax
		mov rbx, 3
		div rbx
		mov qword [tabr + rsi * 8], rax 
		inc rsi
		loop divEach
		
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
		mov byte[tabw + rsi], al
		inc rsi
		loop addItem

	saveToFile:
		mov rax, 2
		mov rdi, fileName
		mov rsi, 577
		mov rdx, 0644o
		syscall

		mov [fdOut], rax

		mov rax, 1
		mov rdi, [fdOut]
		mov rsi, tabw
		mov rdx, 6
		syscall


_end:
	mov rax, 60
	mov rdi, 0
	syscall
