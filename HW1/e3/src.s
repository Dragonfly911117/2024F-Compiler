	.file	"src.c"
	.text
	.section	.rodata
.LC0:
	.string	"true\n"
.LC1:
    .string "false\n"
.LC2:
    .string "%d\n"

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


    movl    $1, %eax
    movl    $0, %ebx
    movq    $1, %r8

    cmpl    %eax, %ebx
    cmove   %r8, %rdi
    call    printBool

.P2:
    movl    $3, %eax
    movl    $4, %ebx
    movl    $.LC2, %edi
    
    test    %eax, %ebx
    jne      .print14

.print20:
    movl    $10, %esi
    movl    $2, %ebx
    imull   %ebx, %esi
    call    printf
    xor     %edi, %edi
    jmp     .P3

.print14:
    movl    $14, %esi
    call    printf
    xor     %edi, %edi

.P3:
    movl    $2, %eax
    movl    $3, %ebx
    cmpl    %eax, %ebx
    jne     .P3Else

    movq    $1, %r8
    cmove   %r8, %rdi
    call    printBool
    jmp     end

.P3Else:
    movl    $4, %eax
    movl    $2, %ebx
    imull   $3, %ebx

    cmpl    %eax, %ebx
    movq    $1, %r8
    movq    $0, %rdi
    cmovle  %r8, %rdi
    call    printBool
    jmp     .end

.end:
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc

printBool:
    push    %rbp
    mov     %rsp, %rbp

    movq    $.LC0, %r8
    movq    $.LC1, %r9

    cmpq    $0, %rdi
    cmove   %r8, %rdi
    cmovne  %r9, %rdi

    call    printf

    movq    %rbp, %rsp
    popq    %rbp
    ret


.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.2.1 20240910"
	.section	.note.GNU-stack,"",@progbits
