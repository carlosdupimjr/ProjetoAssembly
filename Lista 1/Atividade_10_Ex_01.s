.data
	msg1: .asciiz "\n Digite a largura do terreno em metros: "
	msg2: .asciiz "\n Digite o comprimento do terreno em metros: "
	msg3: .asciiz "\n Area do terreno: "
	msg4: .asciiz " metros quadrados."

.text

main:
	#print pedido largura
	li $v0, 4
	la $a0, msg1
	syscall
	
	#Gravar largura
	li $v0, 5
	syscall
	add $t0, $v0, 0		
	
	#print pedido comprimento
	li $v0, 4
	la $a0, msg2
	syscall
	
	#Gravar comprimento
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#Calculo area	
	mul $t2, $t0, $t1
	
	#print mensagem resultado
	li $v0, 4
	la $a0, msg3
	syscall
	
	#print valor resultado
	li $v0, 1
	add $a0, $t2, 0
	syscall
	
	#print undade medida
	li $v0, 4
	la $a0, msg4
	syscall
	
	#Finalizar
	li $v0, 10
	
	
	
	