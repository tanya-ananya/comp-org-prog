.data
str1:   .string "Add result" # String to use
str2:   .string "Sub result" # String to use
str3:   .string "Not result" # String to use
str4:   .string "Neg result" # String to use
hexstr: .string "%x", 10 #String format to use (hex), followed by 

int1:   .word 12
int2:   .word 5
int3:   .word 1000
sub:    .word 0

.text
.globl	main
.type	main, @function

main:
    la x7, int1
    lw x6, 0(x7)

    la x7, int2
    lw x5, 0(x7)

    sub x4, x6, x5

    la x7, sub
    sw x4, 0(x7)

    li a7, 4
    la a0, str2
    ecall

    li a7, 1
    mv a0, x4
    ecall

    li a7, 11
    li a0, 10
    ecall

    li a7, 10
    ecall