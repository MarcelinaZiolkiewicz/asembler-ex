section .data
	array dq 40, 166, 163, 1168, 1036, 1411, 364, 913, 310, 307
	
section .bss
	tabw resq 8

section .text
	global _start

_start:
;11 linijka
	mov rcx, 10
	mov rsi, 9

	subEach:
		mov rax, qword [array + rsi * 8]
		sub rax, 10
		mov qword [array + rsi * 8], rax
		push rax
		dec rsi	
		loop subEach
;22 linijka	
		mov rsi, 0
		mov rcx, 10
	mulEach:
		pop rax
		mov rbx, 3
		div rbx
		mov qword [tabw + rsi * 8], rax 
		inc rsi
		loop mulEach

		
				
_end:
	mov rax, 60
	mov rdi, 0
	syscall
