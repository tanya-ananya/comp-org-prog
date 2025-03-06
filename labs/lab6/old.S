.text
        mv    s0, x0
loop:   addi  s0, s0, 1     # s0 holds the count
        
        # Print the helloworld string
        li    a0, 4            # print a string
        la    a1, helloworld   # load address of helloworld string
        ecall

        # print the number 42
        li    a0, 1      # print an integer
        li    a1, 42     # Why 42? See The Hitchiker's Guide to the Galaxy, Chapter 27
        ecall

        li    a0, 11     # print a character
        li    a1, 32     # space (the character to print)
        ecall

        li    a0, 1      # print an integer
        mv    a1, s0     # s0 contains the count
        ecall

        li    a0, 11     # print a character
        li    a1, 10     # newline 
        ecall

        j     loop
.data
helloworld:      .string "Hello RISC-V World\n"