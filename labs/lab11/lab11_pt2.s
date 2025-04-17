.text
main:
    # Reserve 100 bytes
    li    a0, 9            # sbrk
    li    a1, 100
    ecall

    # a0 has pointer to reserved memory
    la    t0, copy 
    sw    a0, 0(t0)          # store the address into "copy"
    # We could move it to s3 and skip this, but it is a good idea.
    # Note: we use s2, s3, s4 to make sure the values do not change 
    # when we do a call/ecall 

    la    s2, mystring      # s2 points to "mystring"
    la    s3, copy          # s3 points to "copy"
    la    s4, mystring_end  # s4 points to memory after string

loop:
    lb    s0, 0(s2)        # Access byte from string
    sb    s0, 0(s3)        # Copy byte to "copy"
    addi  s2, s2, 1        # Increment s2
    addi  s3, s3, 1        # Increment s3    
    # Now print the array value out
    mv    a1, s0
    li    a0, 1            # print an integer
    ecall

    # print space
    li    a0, 11           # print a character
    li    a1, 32           # space (the character to print)
    ecall      

    bne   s2, s4, loop     # Compare s2 with s4 
    # (address of memory after string) 
    # Jump to loop if not equal
    # We are done, so print the copy
    li    a0, 4            # print a string
    la    a1, copy         # load address of "copy" string
    ecall

    # print NL
    li    a0, 11           # print a character
    li    a1, 10           # NL (the character to print)
    ecall  

    # Caller will have code like this
    la    a0, mystring      # a0 points to "mystring"
    call  find_len
    # Put the length of the string into a1
    # Set count (in register a1) to zero

    li    a0, 11
    li    a1, 34
    ecall

    li    a0, 4
    la    a1, mystring
    ecall

    li    a0, 11
    li    a1, 34
    ecall

    li    a0, 11
    li    a1, 32
    ecall

    li    a0, 1
    ecall

    li    a0, 11
    li    a1, 10
    ecall

    mv    a1, x0
    
    # Exit program
    li    a0, 17
    li    a1, 0
    ecall

find_len:
    # Caller will have code like this:
    la    a0, mystring      # a0 points to "mystring"
    #call  find_len
    # Put the length of the string into a1
    # Set count (in register a1) to zero
    mv    a1, x0
   find_len_loop:
        lb    t0, 0(a0)        # Access byte from string
        addi  a0, a0, 1        # Increment a0 (pointer to next byte)
        addi  a1, a1, 1        # Increment a1 (count)
        # Check: is the byte a zero?
        bne   t0, x0, find_len_loop
        ret

.data       # Data section, initialized variables
mystring:   .string "RISC-V Assembly Programming"
mystring_end: 
#.bss      # VSCode/Venus does not support .bss
copy:       .word 0



# --------------------------------

.text
main:
    # Reserve 100 bytes
    li    a0, 9            # sbrk
    li    a1, 100
    ecall

    # a0 has pointer to reserved memory
    la    t0, copy 
    sw    a0, 0(t0)        

    la    s2, mystring     
    la    s3, copy         
    la    s4, mystring_end  

loop:
    lb    s0, 0(s2)        
    sb    s0, 0(s3)        
    addi  s2, s2, 1        
    addi  s3, s3, 1        

    mv    a1, s0
    li    a0, 1            
    ecall

    li    a0, 11           
    li    a1, 32           
    ecall      

    bne   s2, s4, loop     

    # Print the copied string
    li    a0, 4            
    la    a1, copy         
    ecall

    li    a0, 11           
    li    a1, 10           
    ecall  

    # --- Part 2: Print "string" length ---
    la    a0, mystring     
    call  find_len         # result in a1

    li    a0, 11
    li    a1, 34           # "
    ecall

    li    a0, 4
    la    a1, mystring
    ecall

    li    a0, 11
    li    a1, 34           # "
    ecall

    li    a0, 11
    li    a1, 32           # space
    ecall

    li    a0, 1            # print length
    ecall

    li    a0, 11
    li    a1, 10           # newline
    ecall

    # Exit program
    li    a0, 17
    li    a1, 0
    ecall

# ---- Subroutine ----
find_len:
    mv    a1, x0
find_len_loop:
    lb    t0, 0(a0)        
    addi  a0, a0, 1        
    addi  a1, a1, 1        
    bne   t0, x0, find_len_loop
    ret

.data
mystring:   .string "RISC-V Assembly Programming"
mystring_end:
copy:       .word 0
