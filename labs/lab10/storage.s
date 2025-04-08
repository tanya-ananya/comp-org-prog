.data
myarr:      .word 10, 20, 30, 40, 50, 60
myarr_end:
temp:       .word 0

.text
main:
    la      s0, myarr
myloop:
    lw      t1, 0(s0) 
    mv      a1, t1
    li      a0, 1 
    ecall

    li      a0, 11
    li      a1, 32
    ecall           

    addi    s0, s0, 4            
    la      t1, myarr_end
    blt     s0, t1, myloop

    li      a0, 11
    li      a1, 10
    ecall  

    li      a0, 17
    li      a1, 0
    ecall

#  ------------------------------------------------------------------------------------------------

.text
main:
    la      s0, myarr 
myloop:
    lw      t1, 0(s0)
    la      t2, temp
    lw      t3, 0(t2)
    add     t3, t3, t1
    sw      t3, 0(t2)

    mv      a1, t3
    li      a0, 1 
    ecall

    li      a0, 11
    li      a1, 32
    ecall

    addi    s0, s0, 4
    la      t1, myarr_end
    blt     s0, t1, myloop

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

#  ------------------------------------------------------------------------------------------------

.text
main:
    la   s0, myarr

myloop:
    lw   t1,  0(s0)
    la   t2,  temp
    lw   t3,  0(t2)
    add  t3,  t3,  t1
    sw   t3,  0(t2)

    addi s0, s0, 4
    la   t1, myarr_end
    blt  s0, t1, myloop

    la   t2, temp
    lw   a0, 0(t2)
    li   a7, 1
    ecall

    li   a0, 10
    li   a7, 11
    ecall

    li   a0, 0
    li   a7, 93
    ecall

.data
myarr:     .word 10, 20, 30, 40, 50, 60
myarr_end:
temp:      .word 0

#  ------------------------------------------------------------------------------------------------

# This is written for VSCode/Venus
.text
main:
    # Note: we use s0 to make sure the value does not change
    # when we do a call/ecall
    la      s0, myarr              # s0 points to myarr
myloop:
    lw      t1, 0(s0)              # Get the value t1 = myarr[s0]
    la      t2, temp               # Get the value t2 = address of temp
    lw      t3, 0(t2)              # Get the value t3 = temp
    add     t3, t3, t1             # t3 = temp + myarr[s0]
    sw      t3, 0(t2)              # store t3 in temp
    # Update s0 to point to next word
    addi    s0, s0, 4
    la      t1, myarr_end          # Does s0 == address of word beyond myarr?
    blt     s0, t1, myloop         # if less, jump to myloop
    # Print the final sum value
    la      t2, temp               # Get the value t2 = address of temp
    lw      t3, 0(t2)              # Load the final sum from temp
    mv      a1, t3
    li      a0, 1                  # print an integer
    ecall
    # print NL
    li      a0, 11                 # print a character
    li      a1, 10                 # NL (the character to print)
    ecall
    # exit the program
    li      a0, 17
    li      a1, 0                  # 0 for everything is OK
    ecall

.data # Data section, initialized variables
myarr:      .word 10, 20, 30, 40, 50, 60
myarr_end:  # This will be next word after myarr
temp:       .word 0

#  ------------------------------------ END OF PART ONE
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

#  ------------------------------------ PART TWO
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

#  ------------------------------------ END OF PART ONE
.text
main:
    la      s0, myarr
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
    li      t4, 5
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
