; Assemble:	  nasm -f elf64 AddTwoSum_64_pt3.asm
; Link:		  gcc AddTwoSum_64_pt3.o -o AddTwoSum_64_pt3

; Based on AddTwoSum_64.asm (by Kip Irvine)
; This is adapted for NASM.

    extern  printf      ; We will use this external function

    section .data       ; Data section, initialized variables

mystr: db "%d", 10, 0   ; String format to use (decimal), followed by NL

sum: dq 0

    section .text
    global main
main:
   mov  rax,5
   add  rax,6
   mov  [sum], rax

                      ; Now print the result out
   mov   rdi, mystr   ; Format of the string to print
   mov   rsi, [sum]   ; Value to print
   mov   rax, 0
   call  printf

   mov  rax, 3
   ret
