# arr1_ptr.s: MIPS program for computing vector sum of two 5-element arrays,
#	  sequential array access using pointers

	.data
x:	.word	0:5
y:	.word	0:5
sum:	.word	0:5

prmpt1:	.asciiz	"Please enter 5 integers for first array:"
prmpt2:	.asciiz	"Please enter 5 integers for second array:"
spaces:	.asciiz	"  "
newline:.asciiz	"\n"

	.text

main:	
	la	$a0,prmpt1
	li	$v0,4
	syscall

# i	$s0
# ptr_x	$s1
	
	li	$s0,0
	la	$s1,x		# ptr_x = &x[0]; 

rd_loop:			# for (i=0; i<5;i++) {
	li	$v0,5		#    cin >> *ptr_x; 
	syscall
	sw	$v0,($s1)
	add	$s1,$s1,4	#    ptr_x++; 
	add	$s0,$s0,1
	blt	$s0,5,rd_loop	# }

	la	$a0,prmpt2
	li	$v0,4
	syscall

# i	$s0
# ptr_y	$s1

	li	$s0,0
	la	$s1,y
	
rd_loop1:	
	li	$v0,5		#    cin >> *ptr_y; 
	syscall
	sw	$v0,($s1)
	add	$s1,$s1,4	#    ptr_y++; 
	add	$s0,$s0,1
	blt	$s0,5,rd_loop1


# i	$s0
# ptr_x	$s1
# ptr_y	$s2
# ptr_s	$s3

	li	$s0,0
	la	$s1,x
	la	$s2,y
	la	$s3,sum
				# for (i=0; i<5;i++) {
loop:				#    *ptr_s = *ptr_x + *ptr_y; 



	
				#    ptr_x++; 
				#    ptr_y++; 
				#    ptr_s++; 
	add	$s0,$s0,1
	blt	$s0,5,loop	# }

# i	$s0
# ptr_s	$s1
		
	
	la	$a0,newline
	li	$v0,4
	syscall


	li	$s0,0
	la	$s1,sum		# ptr_s = sum; 
wr_loop:move	$a0,$s0		# for (i=0;i<5;i++) {
	li	$v0,1		#    cout << i << " " << *ptr_s;
	syscall

	la	$a0,spaces
	li	$v0,4
	syscall
	
	lw	$a0,($s1)
	li	$v0,1
	syscall

	la	$a0,newline
	li	$v0,4
	syscall

	add	$s1,$s1,4	#    ptr_s++; 
	add	$s0,$s0,1	#}
	blt	$s0,5,wr_loop

	li	$v0,10
	syscall

