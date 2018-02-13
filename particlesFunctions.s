.globl updatePoint
.globl findDistance

updatePoint:
	# $s2 = int distance
	# $a0 = *arg
	addi	$sp,$sp,-8
	sw		$s2,($sp)
	sw		$ra,4($sp)

	li		$a2,0
	li		$a3,-1
	move	$s6,$a0
	lw		$a0,($s6)
	lw		$a1,4($s6)
	jal		findDistance
	move	$a0,$s6
	move	$s2,$v0				#  distance = findDistance(arg[0],arg[1],0,-1);
	
	bge		$s2,1,call1
	lw		$t0,8($a0)
	bge		$t0,0,call1		#  if ((distance < 1) && (arg[2] < 0))
	mul		$t0,$t0,-1		#    arg[2] = - arg[2];
	sw		$t0,8($a0)
call1:
	li		$a2,10
	li		$a3,-1
	move	$s6,$a0
	lw		$a0,($s6)
	lw		$a1,4($s6)
	jal		findDistance
	move	$a0,$s6
	move	$s2,$v0				#  distance = findDistance(arg[0],arg[1],10,-1);
	
	bge		$s2,1,call2
	lw		$t0,8($a0)
	ble		$t0,0,call2		#  if ((distance < 1) && (arg[2] > 0))
	mul		$t0,$t0,-1		#    arg[2] = - arg[2];
	sw		$t0,8($a0)
call2:
	li		$a2,-1
	li		$a3,0
	move	$s6,$a0
	lw		$a0,($s6)
	lw		$a1,4($s6)
	jal		findDistance
	move	$a0,$s6
	move	$s2,$v0				#  distance = findDistance(arg[0],arg[1],-1,0);
	
	bge		$s2,1,call3
	lw		$t0,12($a0)
	bge		$t0,0,call3		#  if ((distance < 1) && (arg[3] < 0))
	mul		$t0,$t0,-1		#    arg[3] = - arg[3];
	sw		$t0,12($a0)
call3:
	li		$a2,-1
	li		$a3,10
	move	$s6,$a0
	lw		$a0,($s6)
	lw		$a1,4($s6)
	jal		findDistance
	move	$a0,$s6
	move	$s2,$v0				#  distance = findDistance(arg[0],arg[1],-1,10);

	bge		$s2,1,args
	lw		$t0,12($a0)
	ble		$t0,0,args		#  if ((distance < 1) && (arg[3] > 0))
	mul		$t0,$t0,-1		#    arg[3] = - arg[3];
	sw		$t0,12($a0)
args:
	lw		$t0,($a0)
	lw		$t1,4($a0)
	lw		$t2,8($a0)
	lw		$t3,12($a0)
	add		$t0,$t0,$t2		#  arg[0] = arg[0] + arg[2];
	add		$t1,$t1,$t3		#  arg[1] = arg[1] + arg[3];
	sw		$t0,($a0)
	sw		$t1,4($a0)
	
	lw		$ra,4($sp)
	lw		$s2,($sp)
	addi	$sp,$sp,8
	jr		$ra						#  return;
	
findDistance:
	#	$a0 = arg0
	#	$a1 = arg1
	# $a2 = arg2
	# $a3 = arg3
	# $t0 = distX
	# $t1 = distY

	sub		$t0,$a0,$a2		#	distX = arg0 - arg2;
	bge		$t0,0,cont1		# if (distX < 0)
	mul		$t0,$t0,-1		#   distX = - distX;
cont1:
	sub		$t1,$a1,$a3		# distY = arg1 - arg3;
	
	bge		$t1,0,cont2		# if (distY < 0)
	mul		$t1,$t1,-1		#   distY = - distY;
cont2:
	bge		$a0,0,elseif
	bge		$a2,0,elseif		
	move	$v0,$t1				# if ((arg0 < 0)  || (arg2 < 0))
	jr		$ra						#   return distY;
elseif:
	bge		$a1,0,else
	bge		$a3,0,else			
	move	$v0,$t0				# else if ((arg1 < 0)  || (arg3 < 0))
	jr		$ra						#   return distX;
else:
	add		$t2,$t0,$t1		# (distX + distY)		
	move	$v0,$t2				# else
	jr		$ra						#   return distX + distY;