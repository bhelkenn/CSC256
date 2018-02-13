# logical.s: demonstrates bitwise logical operations in MAL

	.data

	.text
	.globl	bk
	
main:	li	$s0, 0x456789ab
      	li	$s1, 0x9abcdef0

	li	$s2, 0xaaaaaaaa

bk:	not	$t0,$s0
	and	$t0,$s0,$s1
	or	$t0,$s0,$s1
	xor	$t0,$s0,$s1

	sll	$t0,$s2,3
	srl	$t0,$s2,3
	sra	$t0,$s2,3

	li	$v0,10
	syscall
