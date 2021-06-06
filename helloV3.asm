;; Well, we gonna make a fancy "Hello World"
section .data
    text1 db "What is your name?",10
    text2 db "Hello, "

section .bss
    name resb 16

section .text
    global _start

_start:
    call _printQuestion
    call _getName
    call _printHello
    call _printName

    mov rax, 60
    mov rdi, 0
    syscall

_printQuestion:
    mov rax, 1
    mov rdi, 1
    mov rsi, text1
    mov rdx, 19
    syscall
    ret

_getName: ;;Here we're using the standard input for get the user's name
    mov rax, 0 
    mov rdi, 0
    mov rsi, name
    mov rdx, 16
    syscall
    ret

_printHello:
    mov rax, 1
    mov rdi, 1
    mov rsi, text2
    mov rdx, 7
    syscall
    ret

_printName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 16
    syscall
    ret