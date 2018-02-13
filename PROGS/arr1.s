# arr1.s: MAL program for computing vector sum of two 5-element arrays 

	.data
x:	.word	0:5
y:	.word	0:5
sum:	.word	0:5

prmpt1:	.asciiz	"Please enter 5 integers for first array:"
prmpt2:	.asciiz	"Please enter 5 integers for second array:"
spaces:	.asciiz	"  "
newline:.asciiz	"\n"

	.text
	.globl	rd_loop
	.globl	rd_loop1
	.globl	loop

main:	
	la	$a0,prmpt1
	li	$v0,4
	syscall

# i	$s0
# &x[0]	$s1
	
	li	$s0,0

	la	$s1,x
				# for (i=0; i<5;i++)
rd_loop:li	$v0,5		#    cin >> x[i]; 
	syscall			
	mul	$t0,$s0,4
	add	$t0,$s1,$t0
	sw	$v0,($t0)
	add	$s0,$s0,1
	blt	$s0,5,rd_loop

	li	$s0,0
	la	$s1,y
	
	la	$a0,prmpt2
	li	$v0,4
	syscall

# i	$s0
# &y[0]	$s1
				# for (i=0; i<5;i++)
rd_loop1:
	li	$v0,5		#    cin >> y[i]; 
	syscall			
	mul	$t0,$s0,4
	add	$t0,$s1,$t0
	sw	$v0,($t0)
	add	$s0,$s0,1
	blt	$s0,5,rd_loop1
	
# i		$s0
# &x[0]		$s1
# &y[0]		$s2
# &sum[0]	$s3
# &x[i]		$t0
# &y[i]		$t1
# &sum[i]	$t2
# 4*i		$t3

	li	$s0,0
	la	$s1,x
	la	$s2,y
	la	$s3,sum
				# for (i=0;i<5;i++) {
loop:	mul	$t3,$s0,4
	add	$t0,$s1,$t3	#    $t0 = &x[i]; 
	add	$t1,$s2,$t3	#    $t1 = &y[i]; 
	add	$t2,$s3,$t3	#    $t2 = &sum[i]; 

	lw	$t4,($t0)	#    sum[i] = x[i] + y[i];
	lw	$t5,($t1)
	add	$t4,$t5,$t4
	sw	$t4,($t2)
	add	$s0,$s0,1	
	blt	$s0,5,loop	# }

	li	$s0,0
	la	$a0,newline
	li	$v0,4
	syscall	

	la	$t0,sum
wr_loop:move	$a0,$s0		# for (i=0;i<5;i++)
	li	$v0,1		#    cout << i << " " << sum[i] << endl;
	syscall

	la	$a0,spaces
	li	$v0,4
	syscall
	
	mul	$t1,$s0,4
	add	$t1,$t1,$t0
	lw	$a0,($t1)
	li	$v0,1
	syscall

	la	$a0,newline
	li	$v0,4
	syscall

	add	$s0,$s0,1
	blt	$s0,5,wr_loop

	li	$v0,10
	syscall

