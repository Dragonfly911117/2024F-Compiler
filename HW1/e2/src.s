	.file	"src.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	myPrint
	.type	myPrint, @function
myPrint:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	myPrint, .-myPrint
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    // P1
    movl    $4, %edi
    addl    $6, %edi
	call	myPrint
    // P2
    movl    $21, %edi
    imull   $2, %edi
	call	myPrint
    // P3
    movq    $7, %rax
    xor     %rdx, %rdx
    movq    $2, %rbx
    div     %rbx 
    movl    $4, %edi
    addq    %rax, %rdi
	call	myPrint
    // P4
    movq    $10, %rax
    xor     %rdx, %rdx
    movq    $5, %rbx
    div     %rbx
    movl    $3, %edi
    movl    $6, %r8d
    imull   %eax, %r8d
    subq    %r8, %rdi
	call	myPrint
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.2.1 20240910"
	.section	.note.GNU-stack,"",@progbits
