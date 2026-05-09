# 2. Receba o raio de uma circunferência. Calcule e mostre o comprimento da circunferência. Considere PI = 3.


.data
	msg1: .asciiz"\n Indique o raio da circunferencia: "
	msg2: .asciiz"\n O comprimento da circunferencia e igual a: "

.text
	li $t0, 3
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	mul $t2, $t0, $t1
	mul $t2, $t2, 2
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	add $a0, $t2, 0
	syscall
	
	li $v0, 10
	syscall
