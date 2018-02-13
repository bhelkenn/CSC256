	.text

main:	li	$s0, 0x85abc019
	li	$s1, 7
	li	$s2, 0
	li	$s3, 0xaaaaaaaa

loop:	sra	$s0, $s0, 2
	or	$s0, $s0, $s3
	add	$s2, $s2, $s0
	addi	$s1, $s1, -2
	bgtz	$s1, loop

end:	li	$v0, 10
	syscall
	