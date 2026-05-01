.data

	msg1: .asciiz"\nIndique a altura da pessoa, em centímetros: "
	msg2: .asciiz"\nA menor altura do grupo é de: "
	msg3: .asciiz"\nA maior altura do grupo é de: "
	msg4: .asciiz"cm."

.text

variaveis:
	li $t0, 1 #count
	li $t1, 0 #altura menor
	li $t2, 0 #altura maior
main:
	#mensagem leitura altura
	li $v0, 4
	la $a0, msg1
	syscall
	#leitura altura
	li $v0, 5
	syscall
	add $t3, $v0, 0
	
	beq $t0, 1, valorBase #se count for o primeiro, vai determinar a primeira altura como base
	ble $t3, $t1, setMenor #se nova altura é menor ou igual altura menor registrada
	bge $t3, $t2, setMaior #se nova altura é maior ou igual altura maior registrada
	
	
validaCount:
	add $t0, $t0, 1 #adiciona 1 no count
	ble $t0, 15, main
	j fimSe

valorBase:
	move $t1, $t3 #faz a primeira altura ser a menor altura
	move $t2, $t3 #faz a primeira altura ser a maior altura	
	j validaCount

setMenor:
	move $t1, $t3 #substitui por nova altura menor
	j validaCount

setMaior:
	move $t2, $t3 #substitui por nova altura maior
	j validaCount

fimSe:
	#mensagem menor altura
	li $v0, 4
	la $a0, msg2
	syscall
	#valor menor altura
	li $v0, 1
	add $a0, $t1, 0
	syscall
	#mensagem unidade de medida
	li $v0, 4
	la $a0, msg4
	syscall
	
	#mensagem maior altura
	li $v0, 4
	la $a0, msg3
	syscall
	#valor maior altura
	li $v0, 1
	add $a0, $t2, 0
	syscall
	#mensagem unidade de medida
	li $v0, 4
	la $a0, msg4
	syscall

#finalizar
li $v0, 10
syscall
	