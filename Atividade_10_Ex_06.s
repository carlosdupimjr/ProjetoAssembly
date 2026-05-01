.data
	msg1: .asciiz"\n Indique o valor A: "
	msg2: .asciiz"\n Indique o valor B: "
	msg3: .asciiz"\n A soma dos valores iguais resulta em C = "
	msg4: .asciiz"\n A multiplicacao dos valores diferentes resulta em C = "
.text
main:
	#mensagem valorA
	li $v0, 4
	la $a0, msg1
	syscall
	#valor A
	li $v0, 5
	syscall
	add $t0, $v0, 0
	#mensagem valorB
	li $v0, 4
	la $a0, msg2
	syscall
	#valor B
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#condicional se iguais
	beq $t0,$t1, seIguais #se valor A igual a valor B, pula para seIguais
	j seDiferentes #se não, pula para seDiferentes
	
seIguais:
	#soma valor A e B
	add $t2, $t0, $t1
	#mensagem resultado soma
	li $v0, 4
	la $a0, msg3
	syscall
	#valor resultado soma
	li $v0, 1
	add $a0, $t2, 0
	syscall
	j FimSe

seDiferentes:
	#multiplicação valor A e B
	mul $t2, $t0, $t1
	#mensagem resultado multiplicacao
	li $v0, 4
	la $a0, msg4
	syscall
	#valor resultado multiplicacao
	li $v0, 1
	add $a0, $t2, 0
	syscall
	j FimSe

FimSe:
	#Finalizar
	li $v0, 10
	syscall