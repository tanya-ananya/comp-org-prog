.data
str1:   .string "Add result" # String to use
str2:   .string "Sub result" # String to use
str3:   .string "Not result" # String to use
str4:   .string "Neg result" # String to use
hexstr: .string "%x", 10 #String format to use (hex), followed by 

int1:   .word 12
int2:   .word 5
int3:   .word 1000
neg_result:    .word 0

newline:    .byte 10

.text
.globl	main
.type	main, @function

main:
    la x7, int2
    lw s0, 0(x7)

    not s2, s0

    li a7, 4
    la a0, str3
    ecall

    li a7, 1
    mv a0, s2
    ecall

    li a7, 11
    la a0, newline
    lb a0, 0(a0)
    ecall

    neg s2, s0

    li a7, 4
    la a0, str4
    ecall

    li a7, 1
    mv a0, s2
    ecall

    li a7, 11
    la a0, newline
    lb a0, 0(a0)
    ecall

    li a7, 10
    ecall