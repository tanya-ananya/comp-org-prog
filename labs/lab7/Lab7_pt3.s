    .data
str1:   .string "Add result"  # String to use
str2:   .string "Sub result"  # String to use
str3:   .string "Not result"  # String to use
str4:   .string "Neg result"  # String to use
hexstr: .string "%x", 10      # String format to use (hex), followed by 

int1:   .word 12
int2:   .word 5
int3:   .word 1000
sum:    .word 0

    .text
    .globl  main
    .type   main, @function

main:
    la x7, int1
    lw x6, 0(x7)

    la x7, int2
    lw x5, 0(x7)

    add x4, x6, x5

    la x7, sum
    sw x4, 0(x7)

    la a0, str1
    call print_string

    mv a0, x4
    call print_int

    li a0, 10
    call print_char

    li a7, 10
    ecall

print_string:
    li a7, 4
    ecall
    ret

print_int:
    mv a1, a0
    li a0, 1
    ecall
    ret

print_char:
    li a7, 11
    ecall
    ret