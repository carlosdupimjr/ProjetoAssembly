.data
	msg1: .asciiz"\n Indique o tamanho da base maior do trapezio: "
	msg2: .asciiz"\n Indique o tamanho da base menor do trapezio: "
	msg3: .asciiz"\n Indique o valor da altura do trapezio: "
	msg4: .asciiz"\n A area do trapezio e de: "

.text
main:
	#mensagem base maior
	li $v0, 4
	la $a0, msg1
	syscall
	#valor base maior
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#mensagem base menor
	li $v0, 4
	la $a0, msg2
	syscall
	#valor base menor
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#mensagem altura
	li $v0, 4
	la $a0, msg3
	syscall
	#valor altura
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	#calculo area
	add $t3, $t0, $t1
	mul $t4, $t3, $2
	div $t5, $t4, 2
	
	#mensagem area
	li $v0, 4
	la $a0, msg4
	syscall
	#resultado area
	li $v0, 1
	add $a0, $t5, 0
	syscall
	
	#finalizar
	li $v0, 10
	syscall