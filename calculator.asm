section .data
    msg1 db "1-son: ", 0xA
    len1 equ $ - msg1
    msg2 db "2-son: ", 0xA
    len2 equ $ - msg2
    msg3 db " (+ - * /): ", 0xA
    len3 equ $ - msg3
    msg4 db "result: ", 0xA
    len4 equ $ - msg4

section .bss
    buf1 resb 100
    buf2 resb 100
    op resb 2
    result resb 20

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, len1
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, buf1
    mov rdx, 100
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, len2
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, buf2
    mov rdx, 100
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, msg3
    mov rdx, len3
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, op
    mov rdx, 2
    syscall

    xor r8, r8
    xor r9, r9
    xor r10, r10

.loop1:
    movzx rax, byte [buf1 + r10]
    cmp rax, 10
    je .done1
    sub rax, '0'
    imul r8, r8, 10
    add r8, rax
    inc r10
    jmp .loop1
.done1:

    xor r10, r10
.loop2:
    movzx rax, byte [buf2 + r10]
    cmp rax, 10
    je .done2
    sub rax, '0'
    imul r9, r9, 10
    add r9, rax
    inc r10
    jmp .loop2
.done2:

    movzx rax, byte [op]
    cmp rax, '+'
    je .add
    cmp rax, '-'
    je .sub
    cmp rax, '*'
    je .mul
    cmp rax, '/'
    je .div

.add: mov rax, r8
      add rax, r9
      jmp .conv
.sub: mov rax, r8
      sub rax, r9
      jmp .conv
.mul: mov rax, r8
      imul rax, r9
      jmp .conv
.div: mov rdx, 0
      mov rax, r8
      div r9
      jmp .conv

.conv:
    mov rbx, 10
    lea rsi, [result + 19]
    mov byte [rsi], 0
.conv_loop:
    xor rdx, rdx
    div rbx
    add dl, '0'
    dec rsi
    mov [rsi], dl
    test rax, rax
    jnz .conv_loop

    mov rax, 1
    mov rdi, 1
    mov rsi, msg4
    mov rdx, len4
    syscall

    mov rax, 1
    mov rdi, 1
    lea rdx, [result + 19]
    sub rdx, rsi
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
