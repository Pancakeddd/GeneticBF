	.text
	.file	"main.cpp"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 3, __gxx_personality_v0
	.cfi_lsda 3, .Lexception0
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$48, %edi
	callq	_Znwm
	leaq	88(%rsp), %rbx
	movq	%rbx, 72(%rsp)
	movw	$88, 88(%rsp)
	leaq	16(%rax), %rcx
	movq	%rcx, (%rax)
	movw	$88, 16(%rax)
	movq	$1, 8(%rax)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 32(%rax)
	movq	$1, 80(%rsp)
	movq	%rax, 8(%rsp)
	leaq	16(%rsp), %rdi
.Ltmp0:
	movq	%rax, %rsi
	callq	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP4TestEET_
.Ltmp1:
# %bb.1:
	movq	72(%rsp), %rdi
	cmpq	%rbx, %rdi
	je	.LBB0_3
# %bb.2:
	callq	_ZdlPv
.LBB0_3:
.Ltmp3:
	movl	$48, %edi
	callq	_Znwm
	movq	%rax, %r12
.Ltmp4:
# %bb.4:
	leaq	40(%rsp), %r13
	movq	%r13, 24(%rsp)
	movl	$1953719636, 40(%rsp)   # imm = 0x74736554
	movq	$4, 32(%rsp)
	movb	$0, 44(%rsp)
	movq	8(%rsp), %rbp
	movq	16(%rsp), %r14
	testq	%r14, %r14
	je	.LBB0_7
# %bb.5:
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB0_6
# %bb.9:
	lock		addl	$1, 8(%r14)
	movq	24(%rsp), %r15
	movq	32(%rsp), %rbx
	movq	%r12, %rdi
	addq	$16, %rdi
	movq	%rdi, (%r12)
	testq	%r15, %r15
	jne	.LBB0_13
# %bb.10:
	testq	%rbx, %rbx
	jne	.LBB0_11
.LBB0_13:
	movq	%rbx, (%rsp)
	cmpq	$16, %rbx
	jb	.LBB0_16
# %bb.14:
.Ltmp8:
	movq	%rsp, %rsi
	xorl	%edx, %edx
	movq	%r12, %rdi
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
	movq	%rax, %rdi
.Ltmp9:
# %bb.15:
	movq	%rdi, (%r12)
	movq	(%rsp), %rax
	movq	%rax, 16(%r12)
.LBB0_16:
	testq	%rbx, %rbx
	je	.LBB0_19
# %bb.17:
	cmpq	$1, %rbx
	jne	.LBB0_8
# %bb.18:
	movb	(%r15), %al
	movb	%al, (%rdi)
	jmp	.LBB0_19
.LBB0_6:
	addl	$1, 8(%r14)
.LBB0_7:
	movq	%r12, %rdi
	addq	$16, %rdi
	movq	%rdi, (%r12)
	movq	$4, (%rsp)
	movl	$4, %ebx
	movq	%r13, %r15
.LBB0_8:
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	memcpy
.LBB0_19:
	movq	(%rsp), %rax
	movq	%rax, 8(%r12)
	movq	(%r12), %rcx
	movb	$0, (%rcx,%rax)
	movq	%rbp, 32(%r12)
	movq	%r14, 40(%r12)
	testq	%r14, %r14
	je	.LBB0_23
# %bb.20:
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB0_22
# %bb.21:
	lock		addl	$1, 8(%r14)
	jmp	.LBB0_23
.LBB0_22:
	addl	$1, 8(%r14)
.LBB0_23:
	movq	%r12, 56(%rsp)
	leaq	64(%rsp), %rdi
.Ltmp11:
	movq	%r12, %rsi
	callq	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP4TestEET_
.Ltmp12:
# %bb.24:
	testq	%r14, %r14
	je	.LBB0_34
# %bb.25:
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB0_27
# %bb.26:
	movl	$-1, %eax
	lock		xaddl	%eax, 8(%r14)
	cmpl	$1, %eax
	je	.LBB0_29
	jmp	.LBB0_34
.LBB0_27:
	movl	8(%r14), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 8(%r14)
	cmpl	$1, %eax
	jne	.LBB0_34
.LBB0_29:
	movq	(%r14), %rax
	movq	%r14, %rdi
	callq	*16(%rax)
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB0_31
# %bb.30:
	movl	$-1, %eax
	lock		xaddl	%eax, 12(%r14)
	cmpl	$1, %eax
	je	.LBB0_33
	jmp	.LBB0_34
.LBB0_31:
	movl	12(%r14), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 12(%r14)
	cmpl	$1, %eax
	jne	.LBB0_34
.LBB0_33:
	movq	(%r14), %rax
	movq	%r14, %rdi
	callq	*24(%rax)
.LBB0_34:
	movq	24(%rsp), %rdi
	cmpq	%r13, %rdi
	je	.LBB0_36
# %bb.35:
	callq	_ZdlPv
.LBB0_36:
	movq	64(%rsp), %rbx
	testq	%rbx, %rbx
	je	.LBB0_46
# %bb.37:
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB0_39
# %bb.38:
	movl	$-1, %eax
	lock		xaddl	%eax, 8(%rbx)
	cmpl	$1, %eax
	je	.LBB0_41
	jmp	.LBB0_46
.LBB0_39:
	movl	8(%rbx), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 8(%rbx)
	cmpl	$1, %eax
	jne	.LBB0_46
.LBB0_41:
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*16(%rax)
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB0_43
# %bb.42:
	movl	$-1, %eax
	lock		xaddl	%eax, 12(%rbx)
	cmpl	$1, %eax
	je	.LBB0_45
	jmp	.LBB0_46
.LBB0_43:
	movl	12(%rbx), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 12(%rbx)
	cmpl	$1, %eax
	jne	.LBB0_46
.LBB0_45:
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*24(%rax)
.LBB0_46:
	movq	16(%rsp), %rbx
	testq	%rbx, %rbx
	je	.LBB0_56
# %bb.47:
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB0_49
# %bb.48:
	movl	$-1, %eax
	lock		xaddl	%eax, 8(%rbx)
	cmpl	$1, %eax
	je	.LBB0_51
	jmp	.LBB0_56
.LBB0_49:
	movl	8(%rbx), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 8(%rbx)
	cmpl	$1, %eax
	jne	.LBB0_56
.LBB0_51:
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*16(%rax)
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB0_53
# %bb.52:
	movl	$-1, %eax
	lock		xaddl	%eax, 12(%rbx)
	cmpl	$1, %eax
	je	.LBB0_55
	jmp	.LBB0_56
.LBB0_53:
	movl	12(%rbx), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 12(%rbx)
	cmpl	$1, %eax
	jne	.LBB0_56
.LBB0_55:
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*24(%rax)
.LBB0_56:
	xorl	%eax, %eax
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB0_11:
.Ltmp6:
	movl	$.L.str.2, %edi
	callq	_ZSt19__throw_logic_errorPKc
.Ltmp7:
# %bb.12:
.LBB0_60:
.Ltmp10:
	movq	%rax, %r15
	movb	$1, %bl
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	jne	.LBB0_63
	jmp	.LBB0_64
.LBB0_61:
.Ltmp13:
	movq	%rax, %r15
	xorl	%ebx, %ebx
	testq	%r14, %r14
	je	.LBB0_71
# %bb.62:
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB0_64
.LBB0_63:
	movl	$-1, %eax
	lock		xaddl	%eax, 8(%r14)
	cmpl	$1, %eax
	je	.LBB0_66
	jmp	.LBB0_71
.LBB0_64:
	movl	8(%r14), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 8(%r14)
	cmpl	$1, %eax
	jne	.LBB0_71
.LBB0_66:
	movq	(%r14), %rax
	movq	%r14, %rdi
	callq	*16(%rax)
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB0_68
# %bb.67:
	movl	$-1, %eax
	lock		xaddl	%eax, 12(%r14)
	cmpl	$1, %eax
	je	.LBB0_70
	jmp	.LBB0_71
.LBB0_68:
	movl	12(%r14), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 12(%r14)
	cmpl	$1, %eax
	jne	.LBB0_71
.LBB0_70:
	movq	(%r14), %rax
	movq	%r14, %rdi
	callq	*24(%rax)
.LBB0_71:
	movq	24(%rsp), %rdi
	cmpq	%r13, %rdi
	jne	.LBB0_72
# %bb.73:
	testb	%bl, %bl
	jne	.LBB0_74
.LBB0_75:
	movq	16(%rsp), %rbx
	testq	%rbx, %rbx
	jne	.LBB0_76
	jmp	.LBB0_85
.LBB0_72:
	callq	_ZdlPv
	testb	%bl, %bl
	je	.LBB0_75
.LBB0_74:
	movq	%r12, %rdi
	callq	_ZdlPv
	movq	16(%rsp), %rbx
	testq	%rbx, %rbx
	jne	.LBB0_76
	jmp	.LBB0_85
.LBB0_59:
.Ltmp5:
	movq	%rax, %r15
	movq	16(%rsp), %rbx
	testq	%rbx, %rbx
	je	.LBB0_85
.LBB0_76:
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB0_78
# %bb.77:
	movl	$-1, %eax
	lock		xaddl	%eax, 8(%rbx)
	cmpl	$1, %eax
	je	.LBB0_80
	jmp	.LBB0_85
.LBB0_78:
	movl	8(%rbx), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 8(%rbx)
	cmpl	$1, %eax
	jne	.LBB0_85
.LBB0_80:
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*16(%rax)
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB0_82
# %bb.81:
	movl	$-1, %eax
	lock		xaddl	%eax, 12(%rbx)
	cmpl	$1, %eax
	je	.LBB0_84
	jmp	.LBB0_85
.LBB0_82:
	movl	12(%rbx), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 12(%rbx)
	cmpl	$1, %eax
	jne	.LBB0_85
.LBB0_84:
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*24(%rax)
	movq	%r15, %rdi
	callq	_Unwind_Resume
.LBB0_57:
.Ltmp2:
	movq	%rax, %r15
	movq	72(%rsp), %rdi
	cmpq	%rbx, %rdi
	jne	.LBB0_58
.LBB0_85:
	movq	%r15, %rdi
	callq	_Unwind_Resume
.LBB0_58:
	callq	_ZdlPv
	movq	%r15, %rdi
	callq	_Unwind_Resume
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
	.section	.gcc_except_table,"a",@progbits
	.p2align	2
GCC_except_table0:
.Lexception0:
	.byte	255                     # @LPStart Encoding = omit
	.byte	3                       # @TType Encoding = udata4
	.asciz	"\367\200"              # @TType base offset
	.byte	3                       # Call site Encoding = udata4
	.byte	117                     # Call site table length
	.long	.Lfunc_begin0-.Lfunc_begin0 # >> Call Site 1 <<
	.long	.Ltmp0-.Lfunc_begin0    #   Call between .Lfunc_begin0 and .Ltmp0
	.long	0                       #     has no landing pad
	.byte	0                       #   On action: cleanup
	.long	.Ltmp0-.Lfunc_begin0    # >> Call Site 2 <<
	.long	.Ltmp1-.Ltmp0           #   Call between .Ltmp0 and .Ltmp1
	.long	.Ltmp2-.Lfunc_begin0    #     jumps to .Ltmp2
	.byte	0                       #   On action: cleanup
	.long	.Ltmp3-.Lfunc_begin0    # >> Call Site 3 <<
	.long	.Ltmp4-.Ltmp3           #   Call between .Ltmp3 and .Ltmp4
	.long	.Ltmp5-.Lfunc_begin0    #     jumps to .Ltmp5
	.byte	0                       #   On action: cleanup
	.long	.Ltmp8-.Lfunc_begin0    # >> Call Site 4 <<
	.long	.Ltmp9-.Ltmp8           #   Call between .Ltmp8 and .Ltmp9
	.long	.Ltmp10-.Lfunc_begin0   #     jumps to .Ltmp10
	.byte	0                       #   On action: cleanup
	.long	.Ltmp9-.Lfunc_begin0    # >> Call Site 5 <<
	.long	.Ltmp11-.Ltmp9          #   Call between .Ltmp9 and .Ltmp11
	.long	0                       #     has no landing pad
	.byte	0                       #   On action: cleanup
	.long	.Ltmp11-.Lfunc_begin0   # >> Call Site 6 <<
	.long	.Ltmp12-.Ltmp11         #   Call between .Ltmp11 and .Ltmp12
	.long	.Ltmp13-.Lfunc_begin0   #     jumps to .Ltmp13
	.byte	0                       #   On action: cleanup
	.long	.Ltmp12-.Lfunc_begin0   # >> Call Site 7 <<
	.long	.Ltmp6-.Ltmp12          #   Call between .Ltmp12 and .Ltmp6
	.long	0                       #     has no landing pad
	.byte	0                       #   On action: cleanup
	.long	.Ltmp6-.Lfunc_begin0    # >> Call Site 8 <<
	.long	.Ltmp7-.Ltmp6           #   Call between .Ltmp6 and .Ltmp7
	.long	.Ltmp10-.Lfunc_begin0   #     jumps to .Ltmp10
	.byte	0                       #   On action: cleanup
	.long	.Ltmp7-.Lfunc_begin0    # >> Call Site 9 <<
	.long	.Lfunc_end0-.Ltmp7      #   Call between .Ltmp7 and .Lfunc_end0
	.long	0                       #     has no landing pad
	.byte	0                       #   On action: cleanup
	.p2align	2
                                        # -- End function
	.section	.text.__clang_call_terminate,"axG",@progbits,__clang_call_terminate,comdat
	.hidden	__clang_call_terminate  # -- Begin function __clang_call_terminate
	.weak	__clang_call_terminate
	.p2align	4, 0x90
	.type	__clang_call_terminate,@function
__clang_call_terminate:                 # @__clang_call_terminate
# %bb.0:
	pushq	%rax
	callq	__cxa_begin_catch
	callq	_ZSt9terminatev
.Lfunc_end1:
	.size	__clang_call_terminate, .Lfunc_end1-__clang_call_terminate
                                        # -- End function
	.section	.text._ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP4TestEET_,"axG",@progbits,_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP4TestEET_,comdat
	.weak	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP4TestEET_ # -- Begin function _ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP4TestEET_
	.p2align	4, 0x90
	.type	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP4TestEET_,@function
_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP4TestEET_: # @_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP4TestEET_
.Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 3, __gxx_personality_v0
	.cfi_lsda 3, .Lexception1
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movq	$0, (%rbx)
.Ltmp14:
	movl	$24, %edi
	callq	_Znwm
.Ltmp15:
# %bb.1:
	movabsq	$4294967297, %rcx       # imm = 0x100000001
	movq	%rcx, 8(%rax)
	movq	$_ZTVSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE+16, (%rax)
	movq	%r15, 16(%rax)
	movq	%rax, (%rbx)
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.LBB2_2:
.Ltmp16:
	movq	%rax, %rdi
	callq	__cxa_begin_catch
	testq	%r15, %r15
	je	.LBB2_16
# %bb.3:
	movq	40(%r15), %r14
	testq	%r14, %r14
	je	.LBB2_13
# %bb.4:
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB2_6
# %bb.5:
	movl	$-1, %eax
	lock		xaddl	%eax, 8(%r14)
	cmpl	$1, %eax
	je	.LBB2_8
	jmp	.LBB2_13
.LBB2_6:
	movl	8(%r14), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 8(%r14)
	cmpl	$1, %eax
	jne	.LBB2_13
.LBB2_8:
	movq	(%r14), %rax
	movq	%r14, %rdi
	callq	*16(%rax)
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB2_10
# %bb.9:
	movl	$-1, %eax
	lock		xaddl	%eax, 12(%r14)
	cmpl	$1, %eax
	je	.LBB2_12
	jmp	.LBB2_13
.LBB2_10:
	movl	12(%r14), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 12(%r14)
	cmpl	$1, %eax
	jne	.LBB2_13
.LBB2_12:
	movq	(%r14), %rax
	movq	%r14, %rdi
	callq	*24(%rax)
.LBB2_13:
	movq	(%r15), %rdi
	leaq	16(%r15), %rax
	cmpq	%rax, %rdi
	je	.LBB2_15
# %bb.14:
	callq	_ZdlPv
.LBB2_15:
	movq	%r15, %rdi
	callq	_ZdlPv
.LBB2_16:
.Ltmp17:
	callq	__cxa_rethrow
.Ltmp18:
# %bb.20:
.LBB2_17:
.Ltmp19:
	movq	%rax, %rbx
.Ltmp20:
	callq	__cxa_end_catch
.Ltmp21:
# %bb.18:
	movq	%rbx, %rdi
	callq	_Unwind_Resume
.LBB2_19:
.Ltmp22:
	movq	%rax, %rdi
	callq	__clang_call_terminate
.Lfunc_end2:
	.size	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP4TestEET_, .Lfunc_end2-_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP4TestEET_
	.cfi_endproc
	.section	.gcc_except_table,"a",@progbits
	.p2align	2
GCC_except_table2:
.Lexception1:
	.byte	255                     # @LPStart Encoding = omit
	.byte	3                       # @TType Encoding = udata4
	.byte	73                      # @TType base offset
	.byte	3                       # Call site Encoding = udata4
	.byte	65                      # Call site table length
	.long	.Ltmp14-.Lfunc_begin1   # >> Call Site 1 <<
	.long	.Ltmp15-.Ltmp14         #   Call between .Ltmp14 and .Ltmp15
	.long	.Ltmp16-.Lfunc_begin1   #     jumps to .Ltmp16
	.byte	1                       #   On action: 1
	.long	.Ltmp15-.Lfunc_begin1   # >> Call Site 2 <<
	.long	.Ltmp17-.Ltmp15         #   Call between .Ltmp15 and .Ltmp17
	.long	0                       #     has no landing pad
	.byte	0                       #   On action: cleanup
	.long	.Ltmp17-.Lfunc_begin1   # >> Call Site 3 <<
	.long	.Ltmp18-.Ltmp17         #   Call between .Ltmp17 and .Ltmp18
	.long	.Ltmp19-.Lfunc_begin1   #     jumps to .Ltmp19
	.byte	0                       #   On action: cleanup
	.long	.Ltmp20-.Lfunc_begin1   # >> Call Site 4 <<
	.long	.Ltmp21-.Ltmp20         #   Call between .Ltmp20 and .Ltmp21
	.long	.Ltmp22-.Lfunc_begin1   #     jumps to .Ltmp22
	.byte	1                       #   On action: 1
	.long	.Ltmp21-.Lfunc_begin1   # >> Call Site 5 <<
	.long	.Lfunc_end2-.Ltmp21     #   Call between .Ltmp21 and .Lfunc_end2
	.long	0                       #     has no landing pad
	.byte	0                       #   On action: cleanup
	.byte	1                       # >> Action Record 1 <<
                                        #   Catch TypeInfo 1
	.byte	0                       #   No further actions
                                        # >> Catch TypeInfos <<
	.long	0                       # TypeInfo 1
	.p2align	2
                                        # -- End function
	.section	.text._ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev,"axG",@progbits,_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev,comdat
	.weak	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev # -- Begin function _ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev
	.p2align	4, 0x90
	.type	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev,@function
_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev: # @_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev
	.cfi_startproc
# %bb.0:
	retq
.Lfunc_end3:
	.size	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev, .Lfunc_end3-_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev
	.cfi_endproc
                                        # -- End function
	.section	.text._ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EED0Ev,"axG",@progbits,_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EED0Ev,comdat
	.weak	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EED0Ev # -- Begin function _ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EED0Ev
	.p2align	4, 0x90
	.type	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EED0Ev,@function
_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EED0Ev: # @_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EED0Ev
	.cfi_startproc
# %bb.0:
	jmp	_ZdlPv                  # TAILCALL
.Lfunc_end4:
	.size	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EED0Ev, .Lfunc_end4-_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EED0Ev
	.cfi_endproc
                                        # -- End function
	.section	.text._ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv,"axG",@progbits,_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv,comdat
	.weak	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv # -- Begin function _ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv
	.p2align	4, 0x90
	.type	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv,@function
_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv: # @_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	16(%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB5_14
# %bb.1:
	movq	40(%rbx), %r14
	testq	%r14, %r14
	je	.LBB5_11
# %bb.2:
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB5_4
# %bb.3:
	movl	$-1, %eax
	lock		xaddl	%eax, 8(%r14)
	cmpl	$1, %eax
	je	.LBB5_6
	jmp	.LBB5_11
.LBB5_14:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.LBB5_4:
	movl	8(%r14), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 8(%r14)
	cmpl	$1, %eax
	jne	.LBB5_11
.LBB5_6:
	movq	(%r14), %rax
	movq	%r14, %rdi
	callq	*16(%rax)
	movl	$__pthread_key_create, %eax
	testq	%rax, %rax
	je	.LBB5_8
# %bb.7:
	movl	$-1, %eax
	lock		xaddl	%eax, 12(%r14)
	cmpl	$1, %eax
	je	.LBB5_10
	jmp	.LBB5_11
.LBB5_8:
	movl	12(%r14), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 12(%r14)
	cmpl	$1, %eax
	jne	.LBB5_11
.LBB5_10:
	movq	(%r14), %rax
	movq	%r14, %rdi
	callq	*24(%rax)
.LBB5_11:
	movq	(%rbx), %rdi
	leaq	16(%rbx), %rax
	cmpq	%rax, %rdi
	je	.LBB5_13
# %bb.12:
	callq	_ZdlPv
.LBB5_13:
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	jmp	_ZdlPv                  # TAILCALL
.Lfunc_end5:
	.size	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv, .Lfunc_end5-_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv
	.cfi_endproc
                                        # -- End function
	.section	.text._ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv,"axG",@progbits,_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv,comdat
	.weak	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv # -- Begin function _ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv
	.p2align	4, 0x90
	.type	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv,@function
_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv: # @_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv
	.cfi_startproc
# %bb.0:
	testq	%rdi, %rdi
	je	.LBB6_1
# %bb.2:
	movq	(%rdi), %rax
	jmpq	*8(%rax)                # TAILCALL
.LBB6_1:
	retq
.Lfunc_end6:
	.size	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv, .Lfunc_end6-_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv
	.cfi_endproc
                                        # -- End function
	.section	.text._ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info,"axG",@progbits,_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info,comdat
	.weak	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info # -- Begin function _ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info
	.p2align	4, 0x90
	.type	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info,@function
_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info: # @_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info
	.cfi_startproc
# %bb.0:
	xorl	%eax, %eax
	retq
.Lfunc_end7:
	.size	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info, .Lfunc_end7-_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info
	.cfi_endproc
                                        # -- End function
	.type	.L.str.2,@object        # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"basic_string::_M_construct null not valid"
	.size	.L.str.2, 42

	.type	_ZTVSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE,@object # @_ZTVSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE
	.section	.rodata._ZTVSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE,"aG",@progbits,_ZTVSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE,comdat
	.weak	_ZTVSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE
	.p2align	3
_ZTVSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE:
	.quad	0
	.quad	_ZTISt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE
	.quad	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev
	.quad	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EED0Ev
	.quad	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv
	.quad	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv
	.quad	_ZNSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info
	.size	_ZTVSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE, 56

	.type	_ZTSSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE,@object # @_ZTSSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE
	.section	.rodata._ZTSSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE,"aG",@progbits,_ZTSSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE,comdat
	.weak	_ZTSSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE
	.p2align	4
_ZTSSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE:
	.asciz	"St15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE"
	.size	_ZTSSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE, 57

	.type	_ZTSSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE,@object # @_ZTSSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE
	.section	.rodata._ZTSSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE,"aG",@progbits,_ZTSSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE,comdat
	.weak	_ZTSSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE
	.p2align	4
_ZTSSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE:
	.asciz	"St16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE"
	.size	_ZTSSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE, 52

	.type	_ZTSSt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE,@object # @_ZTSSt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE
	.section	.rodata._ZTSSt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE,"aG",@progbits,_ZTSSt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE,comdat
	.weak	_ZTSSt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE
	.p2align	4
_ZTSSt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE:
	.asciz	"St11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE"
	.size	_ZTSSt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE, 47

	.type	_ZTISt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE,@object # @_ZTISt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE
	.section	.rodata._ZTISt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE,"aG",@progbits,_ZTISt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE,comdat
	.weak	_ZTISt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE
	.p2align	3
_ZTISt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTSSt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE
	.size	_ZTISt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE, 16

	.type	_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE,@object # @_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE
	.section	.rodata._ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE,"aG",@progbits,_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE,comdat
	.weak	_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE
	.p2align	4
_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE
	.quad	_ZTISt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE
	.size	_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE, 24

	.type	_ZTISt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE,@object # @_ZTISt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE
	.section	.rodata._ZTISt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE,"aG",@progbits,_ZTISt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE,comdat
	.weak	_ZTISt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE
	.p2align	4
_ZTISt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSSt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE
	.quad	_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE
	.size	_ZTISt15_Sp_counted_ptrIP4TestLN9__gnu_cxx12_Lock_policyE2EE, 24

	.weak	__pthread_key_create

	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",@progbits
