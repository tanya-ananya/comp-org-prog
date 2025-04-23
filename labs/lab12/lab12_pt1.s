# rand_pt1.s 
#
# This is written for RARS
#
#   java -jar /home/mweeks/rars1_6.jar rand_pt1.s
#
# Print 20 random values.
# 
# -MCW

    .text
main:
        # Note: we use s0 to make sure the value does not change 
        # when we do a call/ecall 
        li      s0, 20              # s0 holds the count
    
myloop:
        call    get_rand            # get a random value
    
        # Now print the value (of a0) out
        li      a7, 1               # print an integer
        ecall
    
        # print space
        li      a0, 32              # space (the character to print)
        li      a7, 11              # print a character
        ecall           

        # Update s0 to count down
        addi    s0, s0, -1            
        bgt     s0, x0, myloop      # if greater or equal, jump to myloop
    
        # print NL
        li      a0, 10              # NL (the character to print)
        li      a7, 11              # print a character
        ecall           
        
        # exit the program
        li      a0, 0               # 0 for everything is OK
        li      a7, 93
        ecall

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


    .data       # Data section, initialized variables

lfsr:   .word   1