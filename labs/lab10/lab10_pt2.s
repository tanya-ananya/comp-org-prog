.text
main:
    la      t2, min
    li      t3, 100000
    sw      t3, 0(t2)

    la      t2, max
    li      t3, 0
    sw      t3, 0(t2)

    la      t2, sum
    li      t3, 0
    sw      t3, 0(t2)

    la      a0, msg_array
    li      a7, 4
    ecall

    la      s0, myarr
    la      t1, myarr
    li      t2, 6
    slli    t2, t2, 2
    add     t1, t1, t2

printloop:
    lw      t1, 0(s0)

    mv      a0, t1
    li      a7, 1
    ecall

    li      a0, 32
    li      a7, 11
    ecall

    la      t2, min
    lw      t3, 0(t2)
    blt     t1, t3, update_min
    j       skip_min

update_min:
    sw      t1, 0(t2)

skip_min:
    la      t2, max
    lw      t3, 0(t2)
    bgt     t1, t3, update_max
    j       skip_max

update_max:
    sw      t1, 0(t2)

skip_max:
    la      t2, sum
    lw      t3, 0(t2)
    add     t3, t3, t1
    sw      t3, 0(t2)

    addi    s0, s0, 4
    blt     s0, t1, printloop

    li      a0, 10
    li      a7, 11
    ecall

    la      t2, sum
    lw      t3, 0(t2)
    li      t4, 6
    div     t3, t3, t4
    la      t2, avg
    sw      t3, 0(t2)

    la      a0, msg_min
    li      a7, 4
    ecall

    la      t2, min
    lw      a0, 0(t2)
    li      a7, 1
    ecall

    la      a0, msg_max
    li      a7, 4
    ecall

    la      t2, max
    lw      a0, 0(t2)
    li      a7, 1
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
myarr:      .word 10, 20, 30, 40, 50, 60
min:        .word 0
max:        .word 0
sum:        .word 0
avg:        .word 0

msg_min:    .asciiz "\nmin value: "
msg_max:    .asciiz "\nmax value: "
msg_avg:    .asciiz "\naverage value: "
