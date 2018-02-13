
	        .data
redData:	.word   0:4
greenData:  .word   0:4
prmpt1:	 .asciiz "Enter x-coordinate for red particle (0 to 10):"
prmpt2:	 .asciiz "Enter y-coordinate for red particle (0 to 10):"
prmpt3:	 .asciiz "Enter x-coordinate for green particle (0 to 10):"
prmpt4:	 .asciiz "Enter y-coordinate for green particle (0 to 10):"
prmpt5:	 .asciiz "cycle "
prmpt6:	 .asciiz "red particle (x,y,xVel,yVel): "
prmpt7:	 .asciiz "green particle (x,y,xVel,yVel): "
prmpt8:	 .asciiz "Collison: oops, end of simulation!\n"
space:   .asciiz " "
endl:	 	.asciiz "\n"

# i     $s0
# cycle $s1 = 0
# dist  $s2

	.text

main:	li      $s1,0

	la      $s3,redData     #  redData[2] = 1 ;
	li      $s4,1
	sw      $s4,8($s3)
	sw      $s4,12($s3)     #  redData[3] = 1 ;
	la      $s3,greenData   #  greenData[2] = -1 ;
	li      $s4,-1
	sw      $s4,8($s3)
	sw      $s4,12($s3)     #  greenData[3] = -1 ;

	la      $a0,prmpt1      #  cout << prmpt1 ;
	li      $v0,4
	syscall
	la      $s3,redData
	li      $v0,5           #  cin >> redData[0] ;
	syscall
	sw      $v0,($s3)
	la      $a0,prmpt2      #  cout << prmpt2 ;
	li      $v0,4
	syscall
	li      $v0,5           #  cin >> redData[1] ;
	syscall
	sw      $v0,4($s3)
	la      $a0,prmpt3      #  cout << prmpt3 ;
	li      $v0,4
	syscall
	la      $s3,greenData   #  cin >> greenData[0] ;
	li      $v0,5
	syscall
	sw      $v0,($s3)
	la      $a0,prmpt4      #  cout << prmpt4 ;
	li      $v0,4
	syscall
	li      $v0,5           #  cin >> greenData[1] ;
	syscall
	sw      $v0,4($s3)

loop:	                        #  do {
	la      $a0,prmpt5      #    cout << "cycle " << cycle << endl ;
	li      $v0,4
	syscall
	move    $a0,$s1
	li      $v0,1
	syscall
	la      $a0,endl
	li      $v0,4
	syscall
	la      $a0,prmpt6      #    cout << "red particle (x,y,xVel,yVel): "
	li      $v0,4
	syscall
	la      $s3, redData
	lw      $a0,($s3)       #       << redData[0]
	li      $v0,1
	syscall
	la      $a0,space       #       << " "
	li      $v0,4
	syscall
	lw      $a0,4($s3)      #       << redData[1]
	li      $v0,1
	syscall
	la      $a0,space       #       << " "
	li      $v0,4
	syscall
	lw      $a0,8($s3)      #       << redData[2]
	li      $v0,1
	syscall
	la      $a0,space       #       << " "
	li      $v0,4
	syscall
	lw      $a0,12($s3)     #       << redData[3]
	li      $v0,1
	syscall
	la      $a0,endl        #       << endl ;
	li      $v0,4
	syscall
	la      $a0,prmpt7      #    cout << "green particle (x,y,xVel,yVel): "
	li      $v0,4
	syscall
	la      $s3, greenData
	lw      $a0,($s3)       #       << greenData[0]
	li      $v0,1
	syscall
	la      $a0,space       #       << " "
	li      $v0,4
	syscall
	lw      $a0,4($s3)      #       << greenData[1]
	li      $v0,1
	syscall
	la      $a0,space       #       << " "
	li      $v0,4
	syscall
	lw      $a0,8($s3)      #       << greenData[2]
	li      $v0,1
	syscall
	la      $a0,space       #       << " "
	li      $v0,4
	syscall
	lw      $a0,12($s3)     #       << greenData[3]
	li      $v0,1
	syscall
	la      $a0,endl        #       << endl ;
	li      $v0,4
	syscall
	la      $a0,endl        #       << endl ;
	li      $v0,4
	syscall

	la      $a0,redData     #    updatePoint(redData) ;
	jal     updatePoint
	la      $a0,greenData   #    updatePoint(greenData) ;
	jal     updatePoint
	
	la      $s3,redData     #    dist = findDistance(redData[0],
	lw      $a0,($s3)       #       redData[1], greenData[0],
	lw      $a1,4($s3)      #       greenData[1]) ;
	la      $s4,greenData
	lw      $a2,($s4)
	lw      $a3,4($s4)
	jal     findDistance
	move    $s2,$v0
	add     $s1,$s1,1       #    cycle++ ;
	ble     $s2,2,exit      #  } while ((dist > 2) && (cycle < 10)) ;
	blt     $s1,10,loop
exit:
	bgt     $s2,2,end       #  if (dist <= 2) {
	la      $a0,prmpt8      #    cout << prmpt8 ;
	li      $v0,4
	syscall
	la      $a0,prmpt6      #    cout << "red particle (x,y,xVel,yVel): "
	li      $v0,4
	syscall
	la      $s3, redData
	lw      $a0,($s3)       #       << redData[0]
	li      $v0,1
	syscall
	la      $a0,space       #       << " "
	li      $v0,4
	syscall
	lw      $a0,4($s3)      #       << redData[1]
	li      $v0,1
	syscall
	la      $a0,space       #       << " "
	li      $v0,4
	syscall
	lw      $a0,8($s3)      #       << redData[2]
	li      $v0,1
	syscall
	la      $a0,space       #       << " "
	li      $v0,4
	syscall
	lw      $a0,12($s3)     #       << redData[3]
	li      $v0,1
	syscall
	la      $a0,endl        #       << endl ;
	li      $v0,4
	syscall
	la      $a0,prmpt7      #    cout << "green particle (x,y,xVel,yVel): "
	li      $v0,4
	syscall
	la      $s3, greenData
	lw      $a0,($s3)       #       << greenData[0]
	li      $v0,1
	syscall
	la      $a0,space       #       << " "
	li      $v0,4
	syscall
	lw      $a0,4($s3)      #       << greenData[1]
	li      $v0,1
	syscall
	la      $a0,space       #       << " "
	li      $v0,4
	syscall
	lw      $a0,8($s3)      #       << greenData[2]
	li      $v0,1
	syscall
	la      $a0,space       #       << " "
	li      $v0,4
	syscall
	lw      $a0,12($s3)     #       << greenData[3]
	li      $v0,1
	syscall
	la      $a0,endl        #       << endl ;
	li      $v0,4
	syscall
	la      $a0,endl        #       << endl ;
	li      $v0,4
	syscall
end:	li      $v0,10          #  }
	syscall                 #}
