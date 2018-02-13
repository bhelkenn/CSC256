# bye.s: MAL program with output 
	
	.data
out_str:.asciiz	"Goodbye cruel world...\n\n\n"

	.text

main:	la	$a0,out_str	# cout << out_str
	li	$v0,4
	syscall

	li	$v0,10		# exit
	syscall

