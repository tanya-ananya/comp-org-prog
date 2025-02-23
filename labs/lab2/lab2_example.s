	.file	"lab2_example.c"
	.section	.rodata
.LC0:
	.string	"%d %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$6, -4(%rbp)
	movl	$12, -8(%rbp)
	movl	$3, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	-8(%rbp), %edx
	andl	%eax, %edx
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %ecx
	andl	%ecx, %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	-12(%rbp), %eax
	movl	-8(%rbp), %edx
	orl	%eax, %edx
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %ecx
	orl	%ecx, %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	-8(%rbp), %eax
	notl	%eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	notl	%eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
