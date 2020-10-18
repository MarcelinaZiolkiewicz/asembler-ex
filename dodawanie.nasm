section .data
    qNum1   dq  4214
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

section .text
    global _start

_start:
    mov rax, qword [qNum1]
    add rax, qword [qNum2]
    mov qword [qAns1], rax

    mov rax, qword [qNum1]
    add rax, qword [qNum3]
    mov qword [qAns2], rax

    mov rax, qword [qNum3]
    add rax, qword [qNum4]
    mov qword [qAns3], rax

    mov rax, qword [qNum1]
    sub rax, qword [qNum2]
    mov qword [qAns4], rax

    mov rax, qword [qNum1]
    sub rax, qword [qNum3]
    mov qword [qAns5], rax

    mov rax, qword [qNum2]
    sub rax, qword [qNum4]
    mov qword [qAns6], rax

_end:
    mov rax, 60
    mov rdi, 0
    syscall
