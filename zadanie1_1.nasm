section .data
    qNum1   dq  4212
    qNum2   dq  1275
    qNum3   dq  987
    qNum4   dq  125

section .bss
    qAns1    resq    1
    qAns2    resq    1
    qAns3    resq    1
    qAns4    resq    1
    qAns5    resq    1
    qAns6    resq    1
    qAns7    resq    1
    qAns8    resq    1
    qAns9    resq    1
    qAns10   resq    1
    qAns11   resq    1
    qAns12   resq    1

section .text
    global _start

_start:

    call _add
    call _sub
    call _mul
    call _div

_end:
    mov rax, 60
    mov rdi, 0
    syscall

_add:
    mov rax, qword [qNum1]
    add rax, qword [qNum2]
    mov qword [qAns1], rax

    mov rax, qword [qNum1]
    add rax, qword [qNum3]
    mov qword [qAns2], rax

    mov rax, qword [qNum3]
    add rax, qword [qNum4]
    mov qword [qAns3], rax
    ret

_sub:
    mov rax, qword [qNum1]
    sub rax, qword [qNum2]
    mov qword [qAns4], rax

    mov rax, qword [qNum1]
    sub rax, qword [qNum3]
    mov qword [qAns5], rax

    mov rax, qword [qNum2]
    sub rax, qword [qNum4]
    mov qword [qAns6], rax
    ret

_mul:

    mov rax, qword [qNum1]
    mul qword [qNum3]
    mov qword [qAns7], rax
    mov qword [qAns7 + 8], rdx
    
    mov rax, qword [qNum2]
    mul qword [qNum2]
    mov qword [qAns8], rax
    mov qword [qAns8 + 8], rdx
	
    mov rax, qword [qNum2]
    mul qword [qNum4]
    mov qword [qAns9], rax
    mov qword [qAns9 + 8], rdx
    ret

_div:
   
   mov rdx, 0
   mov rax, qword[qNum1]
   div qword[qNum2]
   mov qword[qAns10], rax

   mov rdx, 0
   mov rax, qword[qNum3]
   div qword[qNum4]
   mov qword[qAns11], rax

   mov rdx, 0
   mov rax, qword[qNum1]
   div qword[qNum4]
   mov qword[qAns12], rax
   ret
