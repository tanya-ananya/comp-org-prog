.text
main:
    la    a0, mystring1
    la    a1, mystring2
    jal   ra, string_compare
    beq   a0, x0, not_equal

equal:
    li    a0, 4
    la    a1, print_equal
    ecall
    j     done

not_equal:
    li    a0, 4
    la    a1, print_not_equal
    ecall

done:
    li    a0, 10
    ecall

string_compare:
    mv    t0, a0
    mv    t1, a1

compare_loop:
    lb    t2, 0(t0)
    lb    t3, 0(t1)
    bne   t2, t3, not_eq
    beq   t2, x0, done
    addi  t0, t0, 1
    addi  t1, t1, 1
    j     compare_loop

not_eq:
    li    a0, 0
    ret

done:
    li    a0, 1
    ret

.data
mystring1: .string "RISC-v Assembly Programming"
mystring2: .string "RISC-V Assembly Programming"
print_equal:     .asciiz "equal\n"
print_not_equal: .asciiz "not equal\n"