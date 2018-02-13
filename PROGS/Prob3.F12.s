	.data
x:	.word	0		#int x[] = {0, 29, 13, 9, 0, 3, 7, 7};
	.word	29
	.word	13
	.word	9
	.word	0
	.word	3
	.word	7
	.word	7
	
ascend:	.word	0:8		#int ascend[8] = {0};
endl:	.asciiz	"\n"

# j $s0
# i $s1
# &x[0] $s2
# &ascend[0] $s3
	
	.text
main:	li	$s0, 0		#  int j = 0;
	la	$s2, x
	la	$s3, ascend

				#  for (int i=0; i<7; i++) {
for:				#    if (x[i] < x[i+1]) {






				#      ascend[j] = i;
				#      j++;
				#    }

				#  }

	li	$s1, 0		#  for (int i=0; i<j; i++) {
for1:	mul	$t0, $s1, 4
	add	$t0, $t0, $s3
	lw	$a0, ($t0)
	li	$v0, 1
	syscall			#    cout << ascend[i] << endl;
	la	$a0, endl
	li	$v0, 4
	syscall			#  }

	addi	$s1, $s1, 1
	blt	$s1, $s0, for1

	li	$v0, 10
	syscall


