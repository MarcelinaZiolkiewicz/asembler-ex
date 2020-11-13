 section .data
	qNum1 dq 1
	qNum2 dq 2
	qNum3 dq 1

section .bss
	qAns1 resq 1
	qAns2 resq 1
	qAns3 resq 1

section .text
	global _start


_start: 
	
	mov rax, qword[qNum1]
	mov rdx, qword[qNum2]
	mov rdi, qword[qNum3]

	checkOne:	; 1 > 2
		cmp rax, rdx
		jge resOne
		jle resTwo
		ret
	
	resOne:          ; 1 > 3
		cmp rax, rdi
		jge resThree
		jle resFour
		ret

	resThree:		; 3 > 2
		cmp rdi, rdx
		jge resFive
		jle resSix
		ret

	resFour:
		mov qword[qAns1], rdi
		mov qword[qAns2], rax
		mov qword[qAns3], rdx
		call _end
	
	resFive:
		mov qword[qAns1], rax 
		mov qword[qAns2], rdi
		mov qword[qAns3], rdx
		call _end
	resSix:
		mov qword[qAns1], rax
		mov qword[qAns2], rdx
		mov qword[qAns3], rdi
		call _end
	
	resTwo: ;2 > 3
		cmp rdx, rdi
		jge resSeven
		jle resEight
		ret

	resSeven:
		cmp rdi, rax
		jge resNine
		jle resTen
		ret

	resEight:					
		mov qword[qAns1], rdi
		mov qword[qAns2], rdx
		mov qword[qAns3], rax
		call _end
	
	resNine:
		mov qword[qAns1], rdx
		mov qword[qAns2], rdi
		mov qword[qAns3], rax
		call _end

	resTen:
		mov qword[qAns1], rdx 
		mov qword[qAns2], rax 
		mov qword[qAns3], rdi
		call _end		
		

_end: 
	mov rax, 60
	mov rdi, 0
	syscall
