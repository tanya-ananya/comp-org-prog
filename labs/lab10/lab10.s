.text
main:
    la      s0, myarr
    la      t3, myarr_end
    sub     t3, t3, s0
    li      t4, 4
    div     t3, t3, t4
    mv      t5, t3

    lw      t1, 0(s0)

    la      t2, min
    sw      t1, 0(t2)

    la      t2, max
    sw      t1, 0(t2)

    la      t2, sum
    sw      t1, 0(t2)

    addi    s0, s0, 4

loop:
    la      t3, myarr_end
    bge     s0, t3, endloop

    lw      t1, 0(s0)

    mv      a0, t1
    li      a7, 1
    ecall

    li      a0, 32
    li      a7, 11
    ecall

    la      t2, min
    lw      t4, 0(t2)
    blt     t1, t4, set_min
    j       skip_min

set_min:
    sw      t1, 0(t2)

skip_min:
    la      t2, max
    lw      t4, 0(t2)
    bgt     t1, t4, set_max
    j       skip_max

set_max:
    sw      t1, 0(t2)

skip_max:
    la      t2, sum
    lw      t4, 0(t2)
    add     t4, t4, t1
    sw      t4, 0(t2)

    addi    s0, s0, 4
    j       loop

endloop:
    li      a0, 10
    li      a7, 11 
    ecall

    la      t2, sum
    lw      t3, 0(t2)
    div     t3, t3, t5
    la      t2, avg
    sw      t3, 0(t2)

    la      a0, msg_min
    li      a7, 4
    ecall

    la      t2, min
    lw      a0, 0(t2)
    li      a7, 1
    ecall

    li      a0, 10
    li      a7, 11
    ecall

    la      a0, msg_max
    li      a7, 4
    ecall

    la      t2, max
    lw      a0, 0(t2)
    li      a7, 1
    ecall

    li      a0, 10
    li      a7, 11
    ecall

    la      a0, msg_avg
    li      a7, 4
    ecall

    la      t2, avg
    lw      a0, 0(t2)
    li      a7, 1
    ecall

    li      a7, 10
    ecall

.data
myarr:      .word 90, 10, 55, 60, 25
myarr_end:  .word 0
sum:        .word 0
min:        .word 0
max:        .word 0
avg:        .word 0
msg_min:    .asciiz "The min value is: "
msg_max:    .asciiz "The max value is: "
msg_avg:    .asciiz "The average value is: "