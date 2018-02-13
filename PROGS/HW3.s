	.data
x:	.word	0:10
pos:	.word	1
	.word	3
	.word	6
	.word	9
	.word	-1
	.word	-1
data:	.word	73
	.word	47
	.word	23
	.word	26
	.word	-1
	.word	-1

endl:	.asciiz	"\n"

# i		$s0
# &x[0]		$s1
# &pos[0]	$s2
# &data[0]	$s3
# 6, 10		$s6
# temp = $t0
	
	.text
main:	li	$s0, 0
	la	$s1, x
	la	$s2, pos
	la	$s3, data
	li	$s6, 6
	li	$t0, 0
	la	$t1, pos
	li	$t2, 0
	li	$t3, 0
	la	$t4, x
	la	$t5, data
																	#  for (int i=0; i<6; i++) {
for:	mul	$t2, $s0, 4							#    if (pos[i] >= 0) {
														#	$t2 = i * 4
			add	$t1, $s2, $t2			# $t1 = &pos[0] + i * 4
			lw	$t0, 0($t1)				# int temp = pos[i]
			blt	$t0, 0, loop			# if (pos[i] < 0) goto loop

			# see line 41								#      int temp = pos[i];
			mul	$t3, $t0, 4							#      x[temp] = data[i];
														# temp * 4 = $t3
			add	$t4, $s1, $t3			# &x[0] + temp * 4 = $t4
			add	$t5, $s3, $t2			# &data[0] + i * 4 = $t5
			lw	$t2, 0($t5)				# $t2 = data[i]
			sw	$t2, 0($t4)				# x[temp] = $t2 [= data[i]]


loop:	addi	$s0, $s0, 1						#    }
			blt		$s0, $s6, for					#  }

	li	$s6, 10
	li	$s0, 0		#  for (int i=0; i<10; i++) {
for1:	sll	$t0, $s0, 2	#    cout << x[i] << endl;
	add	$t0, $t0, $s1
	lw	$a0, ($t0)
	li	$v0, 1
	syscall
	la	$a0, endl
	li	$v0, 4
	syscall
	addi	$s0, $s0, 1
	blt	$s0, 10, for1	#  }

	li	$v0, 10
	syscall

