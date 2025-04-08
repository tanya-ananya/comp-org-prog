.text
main:
    la      s0, myarr
myloop:
    lw      t1, 0(s0)
    la      t2, temp
    lw      t3, 0(t2)
    add     t3, t3, t1
    sw      t3, 0(t2)

    addi    s0, s0, 4
    la      t1, myarr_end 
    blt     s0, t1, myloop

    la      t2, temp 
    lw      t3, 0(t2)
    mv      a1, t3
    li      a0, 1 
    ecall

    li      a0, 11
    li      a1, 10 
    ecall

    li      a0, 17
    li      a1, 0 
    ecall

.data 
myarr:      .word 10, 20, 30, 40, 50, 60
myarr_end:
temp:       .word 0
