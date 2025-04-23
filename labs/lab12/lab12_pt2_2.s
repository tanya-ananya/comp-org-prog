    .text
main:
        li      a0, 6
        call    set_seed

        li      s0, 3

myloop:
        call    get_rand 

        li      a7, 1
        ecall

        li      a0, 32
        li      a7, 11
        ecall

        addi    s0, s0, -1
        bgt     s0, x0, myloop

        li      a0, 10
        li      a7, 11
        ecall

        li      a0, 0
        li      a7, 93
        ecall

set_seed:
        la      t0, lfsr
        sw      a0, 0(t0)
        ret

get_rand:
        la      t2, lfsr            # t2 = address of "lfsr"
        lw      t3, 0(t2)           # t3 = word at "lfsr"

        # Need to add code here:
        slli    t4, t3, 11  # shift t3 left by 11 bits
        xor     t3, t3, t4  # lfsr = lfsr xor shift result

        srli    t4, t3, 7   # shift it right by 7 bits
        xor     t3, t3, t4  # lfsr = lfsr xor shift result
    
        slli    t4, t3, 12  # shift it left by 12 bits
        xor     t3, t3, t4  # lfsr = lfsr xor shift result
        
        sw      t3, 0(t2)   # store t3 into "lfsr"

        mv      a0, t3              # a0 = t3 to return
        ret

    .data
lfsr:   .word   1