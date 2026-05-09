# 1. Receba os valores do comprimento, largura e altura de um paralelepípedo. Calcule e mostre seu volume.


.data
	msg1: .asciiz"\n Indique a altura do paralelepipedo: "
	msg2: .asciiz"\n Indique a largura do paralelepipedo: "
	msg3: .asciiz"\n Indique o comprimento do paralelepipedo: "
	msg4: .asciiz"\n O volume do paralelepipedo Ã© igual a: "
.text
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	mul $t3, $t0, $t1
	mul $t3, $t3, $t2
	
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	add $a0, $t3, 0
	syscall
	
	li $v0, 10
	syscall
