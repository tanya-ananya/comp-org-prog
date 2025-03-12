#define PRINT_INT 4
#define EXIT_PROG 93

.macro print_string(%x)
    li     a7, PRINT_INT
    la     a0, %x
    ecall
.end_macro

.macro print_char(%x)
    li    a7, PRINT_CHAR
    li    a0, %x
    ecall
.end_macro

        .data
str1:   .string "Add result" # String to use
str2:   .string "Sub result" # String to use
str3:   .string "Not result" # String to use
str4:   .string "Neg result" # String to use
hexstr: .string "%x", 10 #String format to use (hex), followed by 

int1:   .word 12
int2:   .word 5
int3:   .word 1000
sum:    .word 0

    .text
    .globl  main
    .type   main, @function

main:
    li  a7, PRINT_INT
    la  a0, title
    ecall

    li  a7, PRINT_INT
    la  a0, apple1
    ecall

    li  a7, PRINT_INT
    la  a0, apple2
    ecall

    li  a7, PRINT_INT
    la  a0, apple3
    ecall

    li  a7, EXIT_PROG
    li a0, 03
    ecall