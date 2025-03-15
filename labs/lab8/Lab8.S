# This is an assembly language program written for the Venus simulator
#

    .text

main:
   lw    t0, int2
                          # Now print the result out
   mv    a1, t0           # Value to print (label "to" is NOT defined)
   li    a7, 1
   ecall 

   li    a0, 11     
   li    a1, 1
   ecall                  # adds a newline

   ret

    .data
    # Define integer values
int1:    .word 10
int2:    .word 5
sum:     .double 0