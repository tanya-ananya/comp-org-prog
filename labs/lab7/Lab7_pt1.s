.macro print_string(%x)
    li     a7, 4
    la     a0, %x
    ecall
.end_macro

.macro print_char(%x)
    li    a7, 11
    la    a1, %x
    lb    a0, 0(a1)
    ecall
.end_macro

.text
main:
     	li	a7, 4
        la	a0, title
        ecall

	li	a7, 4
        la	a0, apple1
        ecall

	li	a7, 4
        la	a0, apple2
        ecall

	li	a7, 4
        la	a0, apple3
        ecall

	li	a7, 93
        li	a0, 42
        ecall

.data
title:  .string "Types of apples:\n"
apple1: .string " Fuji\n"
apple2: .string " Gala\n"
apple3: .string " Granny Smith\n"
char1:  .byte 0x23